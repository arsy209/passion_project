def display_error
  error = session[:error]
  session[:error] = nil

  if error
    return erb :'errors/account_entry_errors', layout: false, locals: {errors: error}
  else
    return ""
  end
end

def login_error
  error = session[:error]
  session[:error] = nil
  if error
    "Your username or password is/are invalid\n"
  else
    return ""
  end
end