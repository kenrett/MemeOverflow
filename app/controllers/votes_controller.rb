class VotesController < ApplicationController
  def create
    @vote = Vote.where(voter_id: session[:id], meme_id: params[:meme_id]).first

    create_or_update_vote(@vote, params, session)

    redirect_to :root
  end

#is this useless now? our create method is doing both a update and create 
  def update
    
  end

  def destroy
    vote = Vote.find(params[:id])
    vote.destroy
    redirect_to :root, flash[:notice] = "Your vote has been deleted!"
  end

  private
  def create_or_update_vote(vote, params, session)
    if vote
      vote.update_attributes(vote_type: params[:vote_type])
      flash[:notice] = "Your vote has been updated!"
    else
      Vote.create(vote_type: params[:vote_type], voter_id: session[:id], meme_id: params[:meme_id])
      flash[:notice] = "Your vote has been created!"
    end
  end
end
