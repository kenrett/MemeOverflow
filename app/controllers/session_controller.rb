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

  private

  def find_user_by_uid
    User.find_by_uid(request.env["omniauth.auth"]["uid"])
  end

  def create_user_by_uid
    begin
      @user = User.create_with_omniauth(auth)
    rescue Exception => e
      redirect_to root_path, :notice => "Something went wrong!"
    end
  end

  # def find_or_create_user_by_uid
  #   @user = find_user_by_uid || create_user_by_uid
  # end
end
