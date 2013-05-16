class HomeController < ApplicationController
  def index
    @meme = Meme.new
    @memes = Meme.all
    # @leaders = User.all.order(:score).limit(10)
  end
end
