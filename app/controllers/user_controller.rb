class UserController < ApplicationController
  def show
    @user = User.find(params[:id])
    @memes = MemeDecorator.decorate_collection(@user.memes)
  end
end
