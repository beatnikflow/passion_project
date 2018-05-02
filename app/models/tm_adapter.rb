require 'httparty'

class TmAdapter
  include HTTParty
  attr_accessor :options

  base_uri 'https://app.ticketmaster.com'

  def initialize
    @options = { query: {apikey: ENV['TM_ACCESS_TOKEN'],
      classificationName: 'Music' }}
  end

  def search_concerts_by_city(city)
    @options[:query][:city] = city
    # eap city
    # eap city.class
    # @options[:query][:city]
    result = self.class.get('/discovery/v2/events', @options)
    JSON.parse(result.parsed_response)

  end

  def parse_events(payload)
    # eap payload
    # return array of hashes with the following data: id
    # name link datetime venue address postal code image
    results = []
    # payload['_embedded']['events']
    payload['_embedded']['events'].each do |event|
      eap event
      event_data = {}
      event_data[:name] = event['name']
      event_data[:id] = event['id']
      event_data[:url] = event['url']
      event_data[:city] = event['_embedded']['venues'].last['city']['name']
      event_data[:state] = event['_embedded']['venues'].last['state']['name']
      event_data[:address] = event['_embedded']['venues'].last['address']['line1']
      time = event['dates']['start']['dateTime'] ||= ""
      time.split("T")
      if time != ""
        event_data[:date] = time.split("T")[0]
        event_data[:start_time] = time.split("T")[1][0..-2]
      else
        event_data[:date] = "These fuckers forgot"
        event_data[:start_time] = "to supply some very important info"
      end
      results << event_data
    end
    results
  end

  def event_image
  end




end