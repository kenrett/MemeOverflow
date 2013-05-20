class UserController < ApplicationController
  def show
    @user = User.find(params[:id])
    @memes = @user.memes
    @user_votes = load_user_votes_hash(current_user)
  end
end
