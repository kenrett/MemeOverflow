class HomeController < ApplicationController
  def index
    @meme = Meme.new
    @memes = Meme.order("score DESC")
    if current_user
      load_user_votes_hash
    end
  end
end
