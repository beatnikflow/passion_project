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
    self.class.get('/discovery/v2/events', @options)

  end

  def event_image
  end


end