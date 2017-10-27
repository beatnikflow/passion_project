require 'httparty'

class TmAdapter
  include HTTParty

  base_uri 'https://app.ticketmaster.com'

  def initialize
    @options = { query: {apikey: ENV['TM_ACCESS_TOKEN'],
      classificationName: 'Music' }}
  end

  def search_by_city(city)
    @options[:query][:city] = city
    result = self.class.get('/discovery/v2/events', @options)
    JSON.parse(result.parsed_response)
  end

  def parse_events(payload)
    eap payload
    # return array of hashes with the following data: id
    # name link datetime venue address postal code image
    results = []
    payload['_embedded']['events'].each do |event|
      event_data = {}
      event_data[:name] = event['name']
      event_data[:id] = event['id']
      event_data[:url] = event['url']
      results << event_data
    end
    results
  end

  def event_image
  end




end