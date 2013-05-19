class UserController < ApplicationController
  def show
    @user = User.find(params[:id])
    @memes = @user.memes
    if current_user
      load_user_votes_hash
    end
  end
end
