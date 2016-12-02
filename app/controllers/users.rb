get '/signup' do
  erb :'users/signup'
end

post '/signup' do
  user = User.new(params[:user])
  if user.save
    session[:user_id] = user.id
    redirect("/")
  else
    session[:error] = user.errors.messages
    redirect("/signup")
  end
end

