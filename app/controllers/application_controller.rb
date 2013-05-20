class ApplicationController < ActionController::Base
  include Authentication
  protect_from_forgery
  helper_method :current_user
  STATUSES = ["created_at", "score"]

  def load_user_votes_hash
    @user_votes = {}
    current_user.votes.map { |vote| @user_votes[vote.meme_id] = vote.vote_type }
  end

  def sort_by(sort_params)
    if sort_params && STATUSES.include?(sort_params)
      sort_by = sort_params
    else
      sort_by = "score"
    end
  end
end
