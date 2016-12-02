def current_user
  if session[:user_id]
    return User.find(session[:user_id])
  else
    return nil
  end
end

def logged_in
  redirect('/login') if session[:user_id] == nil
end