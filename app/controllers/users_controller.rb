get '/users/new' do
  erb :'/users/new'
end

post '/users' do
  @user = User.new(params[:user])
    if @user.save
      redirect "/users/#{@user.id}"
      # Why the fuck is this route not working? Interpolation is not working.
    else
      @errors = @user.errors.full_messages
      erb :'/users/new'
    end
end

get '/users/:id' do
  @user = User.find(params[:id])
  erb :'users/show'
end

