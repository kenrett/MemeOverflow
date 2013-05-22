class HomeController < ApplicationController

  def index
    @presenter = Home::IndexPresenter.new(current_user, params[:sort_by], params[:page])
    @memes = MemeDecorator.decorate_collection(@presenter.memes)
  end

  def aboutus
  end
end
