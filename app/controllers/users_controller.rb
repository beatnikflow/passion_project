get '/users/new' do
  # @fb = FbAdapter.new
  if request.xhr?
    erb :'/users/_newuserform', layout: false
  else
    erb :'/users/new'
  end
end

post '/users' do
  @user = User.new(params[:user])
    if @user.save
      session[:id] = @user.id
      redirect "/users/#{@user.id}"
    else
      @errors = @user.errors.full_messages
      erb :'/users/new'
    end
end

get '/users/:id' do
  @user = User.find(params[:id])
  erb :'users/show'
end

