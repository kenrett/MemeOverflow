module Authentication
<<<<<<< HEAD

  def login(user)
    session[:id] = user.id
=======
  def login user
    session[:user_id] = user.id
    redirect_to root_path, :notice => "Signed in!"
>>>>>>> 39a21253254e77674abc5ec48215c15e29a33584
  end

  def current_user
    @current_user ||= User.find(session[:id]) if session[:id]
  end
<<<<<<< HEAD

=======
>>>>>>> 39a21253254e77674abc5ec48215c15e29a33584
end
