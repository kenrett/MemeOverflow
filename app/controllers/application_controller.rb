class ApplicationController < ActionController::Base
  include Authentication
  protect_from_forgery
  helper_method :current_user
  helper_method :user_votes
  def user_votes
    @user_votes ||=  current_user.present? ? current_user.meme_votes : {}
  end
end
