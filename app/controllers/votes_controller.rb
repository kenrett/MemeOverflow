class VotesController < ApplicationController
  def create
    if current_user
      @vote = Vote.where(voter_id: current_user.id, meme_id: params[:meme_id]).first
      create_or_update_vote(@vote)
      redirect_to :root
    else
      redirect_to "/auth/google_oauth2"
    end
  end

  private
  def create_or_update_vote(vote)
    if vote
      vote.update_attributes(vote_type: params[:vote_type])
      flash[:notice] = "Your vote has been updated!"
    else
      Vote.create(vote_type: params[:vote_type], voter_id: current_user.id, meme_id: params[:meme_id])
      flash[:notice] = "Your vote has been created!"
    end
  end
end
