require 'json'

get '/' do
  ep
  @tm_adapter = TmAdapter.new
  res = @tm_adapter.search_by_city('Oakland')
  eap JSON.parse(res.parsed_response)
  erb :index
end