get '/' do
  erb :index
end

get '/login' do
  erb :'index'
end

post '/login' do
  user = User.find_by(username: params[:user][:username]).try(:authenticate, params[:user][:password])
  if user
    session[:user_id] = user.id
    redirect("/playlists/all")
  else
    session[:error] = true
    redirect("/login")
  end
end

get '/signup' do
  erb :'auth/signup', layout: false
end

post '/signup' do
  user = User.new(params[:user])
  if user.save
    session[:user_id] = user.id
    redirect("/playlists/all")
  else
    session[:error] = user.errors.messages
    redirect("/signup")
  end
end

get '/logout' do
  session[:user_id] = nil
  redirect("/login")
end