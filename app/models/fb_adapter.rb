require 'koala'
class FbAdapter
  # Koala.configure do |config|
  #   config.access_token ENV['FB_ACCESS_TOKEN']
  # end

  @graph = Koala::Facebook::API.new(ENV['FB_ACCESS_TOKEN'])
  binding.pry
end