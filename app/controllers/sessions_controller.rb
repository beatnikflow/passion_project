get '/sessions/new' do
  erb :'/sessions/new'
end

post '/sessions' do
  @user = User.authenticate(params[:email], params[:password])
  if @user
    session[:id] = @user.id
    redirect "/users/#{@user.id}"
  else
    @errors = ["Email or Password is Incorrect"]
    erb :'/sessions/new'
  end
end

delete '/sessions' do
  session[:id] = nil
  redirect '/'
end
