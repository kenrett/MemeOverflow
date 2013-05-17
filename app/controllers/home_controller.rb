class HomeController < ApplicationController
  def index
    @meme = Meme.new
    @memes = Meme.order("score DESC").includes(:votes).all
    @leaders = User.order(:score).limit(10)
  end
end
