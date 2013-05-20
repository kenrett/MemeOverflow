class HomeController < ApplicationController
  def index
    @meme = Meme.new
    @memes = Meme.order("score DESC").where("score > ?", -10)
    if current_user
      load_user_votes_hash
    end
    @leaders = User.order("score DESC").limit(10)
  end

  def aboutus
  end
end
