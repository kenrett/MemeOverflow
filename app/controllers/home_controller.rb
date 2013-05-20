class HomeController < ApplicationController

  def index
    @meme = Meme.new
    sort_by = sort_by(params[:sort_by])
    @memes = Meme.where("score > ?", -10).paginate(:page => params[:page], :per_page => 30).order("#{sort_by} DESC")
    if current_user
      load_user_votes_hash
    end
    @leaders = User.order("score DESC").limit(10)
  end

  def aboutus
    @team_meme = Meme.find(4)
  end
end
