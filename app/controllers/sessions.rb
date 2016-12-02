get '/' do
  redirect '/playlists/all'
end

get '/login' do
  erb :'sessions/login'
end


post '/login' do
  user = User.find_by(username: params[:user][:username]).try(:authenticate, params[:user][:password])
  if user
    session[:user_id] = user.id
    redirect("/")
  else
    session[:error] = true
    redirect("/login")
  end
end

get '/users/all' do
  @users = User.all
  erb :'users/all'
end

get '/users/:id' do
  @user = User.find(params[:id])
  @playlists = @user.playlists
  erb :'users/show'
end

get '/logout' do
  session[:user_id] = nil
  redirect("/")
end

