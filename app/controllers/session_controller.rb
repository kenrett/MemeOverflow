class SessionController < ApplicationController

  def create
    user = User.find_or_create_user_by_uid(request.env["omniauth.auth"])
    login(user)
    redirect_to root_path, :notice => "Signed in!"
  end

  def destroy
    session.clear
    redirect_to root_path
  end

end
