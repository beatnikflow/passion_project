get '/artists' do
  @artists = Artist.all
  erb :'artists/index'
end

# Is posting/editing/updating necessary??? Maybe give users ability to add local shows aside from using API data??

