get '/events/search' do
  return erb :'/events/search', layout: false if request.xhr?
  erb :'_location_search_form'
end

post '/events/search' do
  @tm_adapter = TmAdapter.new
  @results = @tm_adapter.search_concerts_by_city(params[:city])
  @results = @tm_adapter.parse_events(@results)
  # @results
  erb :index
end