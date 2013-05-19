class MemesController < ApplicationController
  def new
    @meme = Meme.new
  end

  def show
    @meme = Meme.find(params[:id])
    if current_user
      load_user_votes_hash
    end
  end

  def create
    @user = current_user
    @meme = Meme.new(url: params[:url])
    @meme.update_attributes(:creator_id => @user.id)
    if @meme.save
      flash[:notice] = @meme.url
      load_user_votes_hash
      render :json => render_to_string(:partial => "memes/meme", :locals => { :meme => @meme })
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
