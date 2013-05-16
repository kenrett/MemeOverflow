class MemesController < ApplicationController
  def new
    @meme = Meme.new
  end  

  def show
    @meme = Meme.find(params[:id])
  end

  def create
    p params
    @user = current_user
    @meme = Meme.new(params[:meme])
    @meme.update_attributes(:creator_id => @user.id)
    if @meme.save
      flash[:notice] = "thanks for uploading a meme to MemeOverflow!"
    else
      flash[:error] = @meme.errors.full_messages.join(', ')
    end
    redirect_to :root
  end

  def destroy
    @meme = Meme.find(params[:id])
    @meme.destroy
    redirect_to :root
  end
end
