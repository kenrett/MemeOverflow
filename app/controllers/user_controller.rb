class UserController < ApplicationController
  def show
    @user = User.find(params[:id])
    @memes = @user.memes
  end
end
