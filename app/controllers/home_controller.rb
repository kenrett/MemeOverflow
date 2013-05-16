class HomeController < ApplicationController
  def index
    @meme = Meme.new
  end
end
