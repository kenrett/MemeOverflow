class MemesController < ApplicationController
  def new
    @meme = Meme.new
  end  

  def show
    @meme = Meme.find(params[:id])
  end

  def create
    p params
    @user = current_user # change this to work with session
    @meme = Meme.new(url: params[:url])
    @meme.update_attributes(:creator_id => @user.id)
    if @meme.save
      flash[:notice] = "thanks for uploading a meme to MemeOverflow!"
    else
      flash[:error] = @meme.errors.full_messages.join(', ')
    end
    redirect_to :root
  end

  def destroy
  end
end
