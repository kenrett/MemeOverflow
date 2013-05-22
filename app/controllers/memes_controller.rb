class MemesController < ApplicationController
  def new
    @meme = Meme.new
  end

  def show
    @meme = Meme.find(params[:id]).decorate
  end

  def create
    # REVIEW: I don't get line 12, what's the purpose of that?
    @user = current_user
    @meme = Meme.new(url: params[:url])
    # Review: avoid setting creator_id directly and use assocations instada :creator => current_user
    @meme.update_attributes(:creator_id => @user.id)
    if @meme.save
      # REVIEW: is this flash doing anything? you're responding with json, so how are you handling this flash notice on
      # the client?
      flash[:notice] = @meme.url
      render :json => render_to_string(:partial => "memes/meme", :locals => { :meme => @meme })
    else
      # REVIEW: be consistent, if you're responding with json, then do the same thing in case of errors.
      flash[:error] = @meme.errors.full_messages.join(', ')
    end
  end

  def destroy
    @meme = Meme.find(params[:id])
    @meme.destroy
    redirect_to :root
  end
end
