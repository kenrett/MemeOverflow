class HomeController < ApplicationController
  def index
    @meme = Meme.new
    @memes = Meme.all
  end
end
