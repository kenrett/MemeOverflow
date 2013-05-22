class SessionController < ApplicationController

  def create
    # REVIEW: love this direction, but why not move this to the user model?
    find_or_create_user_by_uid
    login(@user)
  end

  def destroy
    session.clear
    redirect_to root_path
  end

  def omniauth_failure
    flash[:notice] = "Y u no authorize?"
    redirect_to root_path
  end

  private
  # REVIEW: great direction, but if we move the call to find_or_create_user_by_uid to the user
  # model, we won't need lines 22-32, good job though.
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
