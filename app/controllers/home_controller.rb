class HomeController < ApplicationController
    STATUSES = ["created_at", "score"]

  def index
    @meme = Meme.new
    if params[:sort_by] && STATUSES.include?(params[:sort_by])
      sort_by = params[:sort_by]
    else
      sort_by = "score"
    end
    @memes = Meme.order("#{sort_by} DESC").where("score > ?", -10)
    if current_user
      load_user_votes_hash
    end
    @leaders = User.order("score DESC").limit(10)
  end
end
