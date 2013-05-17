module Authentication

  def login(user)
    session[:id] = user.id
  end

  def current_user
    @current_user ||= User.find(session[:id]) if session[:id]
  end

end
