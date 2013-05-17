class SessionController < ApplicationController
  def create
    find_or_create_user_by_uid
    login(@user)
  end

  def destroy
    session.clear
    redirect_to root_path
  end

  private

  def find_user_by_uid
    User.find_by_uid(auth["uid"])
  end

  def create_user_by_uid
    User.create_with_omniauth(auth)
  end

  def find_or_create_user_by_uid
    @user = find_user_by_uid || create_user_by_uid
  end

  def auth
    request.env["omniauth.auth"]
  end

end
