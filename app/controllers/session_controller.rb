class SessionController < ApplicationController
  def create
    auth = request.env["omniauth.auth"]
    user = User.find_by_uid(auth["uid"]) || User.create_with_omniauth(auth)
    session[:id] = user.id
    redirect_to root_path, :notice => "Signed in!"
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
