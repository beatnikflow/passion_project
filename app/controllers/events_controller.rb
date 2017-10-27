get '/events/search' do
  return erb :'/events/search', layout: false if request.xhr?
  erb :'/events/search'
end

post '/events/search' do
  @tm_adapter = TmAdapter.new
  @results = @tm_adapter.search_by_city(params[:city])
  eap @results = @tm_adapter.parse_events(@results)
  erb :index
end