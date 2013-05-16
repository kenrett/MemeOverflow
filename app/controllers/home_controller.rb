class HomeController < ApplicationController
  def index
    @meme = Meme.new
    @memes = Meme.includes(:votes).all
  end
end
