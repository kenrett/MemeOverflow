class HomeController < ApplicationController

  def index
    @meme = Meme.new
    sort_by = sort_by(params[:sort_by])
    @memes = Meme.order("#{sort_by} DESC").where("score > ?", -10)
    if current_user
      load_user_votes_hash
    end
    @leaders = User.order("score DESC").limit(10)
  end
end
