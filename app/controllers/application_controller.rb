class ApplicationController < ActionController::Base
  include Authentication
  protect_from_forgery
  helper_method :current_user

  def load_user_votes_hash(current_user)
    user_votes = {}
    if current_user && current_user.votes.length > 0
      current_user.votes.each { |vote| user_votes[vote.meme_id] = vote.vote_type }
    end
    user_votes
  end
end