class MemesController < ApplicationController
  def new
    @meme = Meme.new
  end

  def show
    @meme = Meme.find(params[:id]).decorate
  end

  def create
    @user = current_user
    @meme = Meme.new(url: params[:url], :creator_id => @user.id)
    if @meme.save
      @meme = @meme.decorate
      flash[:notice] = "Successfully Uploaded :)"
      render :json => render_to_string(:partial => "memes/meme", :locals => {:meme => @meme, :size => :small})
    else
      flash[:error] = @meme.errors.full_messages.join(', ')
    end
  end

  def destroy
    @meme = Meme.find(params[:id])
    @meme.destroy
    redirect_to :root
  end
end
