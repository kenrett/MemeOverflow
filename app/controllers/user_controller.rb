class UserController < ApplicationController
  def new
  end

  def create
  end

  def destroy
  end

  def show
    @user = User.find(params[:id])
    @memes = @user.memes
  end

end
