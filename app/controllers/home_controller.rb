class HomeController < ApplicationController

  def index
    @presenter = Home::IndexPresenter.new(current_user, params[:sort_by], params[:page])
    @user_votes = load_user_votes_hash(current_user)
  end

  def aboutus
  end
end
