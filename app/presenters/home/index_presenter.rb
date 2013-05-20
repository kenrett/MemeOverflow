class Home::IndexPresenter
  STATUSES = ["created_at", "score"]

  def initialize(current_user, sort_by_params, page_params)
    @current_user = current_user
    @sort_by_params = sort_by_params
    @page_params = page_params
  end

  def memes
    sort_by = sort_by(@sort_by_params)
    Meme.where("score > ?", -10).paginate(:page => @page_params, :per_page => 30).order("#{sort_by} DESC")
  end

  def leaders
    User.order("score DESC").limit(10)
  end

  def sort_by(sort_params)
    if sort_params && STATUSES.include?(sort_params)
      sort_by = sort_params
    else
      sort_by = "score"
    end
  end

  # def user_votes
  #   load_user_votes_hash if @current_user
  # end

  # # this needs to extracted as there is a same method application controller
  # def load_user_votes_hash
  #   user_votes = {}
  #   if @current_user.votes.length > 0
  #     @current_user.votes.map { |vote| user_votes[vote.meme_id] = vote.vote_type }
  #   else
  #     return false
  #   end
  # end

end