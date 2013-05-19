class ApplicationController < ActionController::Base
  include Authentication
  protect_from_forgery
  helper_method :current_user

  def load_user_votes_hash
    @user_votes = {}
    current_user.votes.map { |vote| @user_votes[vote.meme_id] = vote.vote_type }
  end
end
