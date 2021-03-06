class VotesController < ApplicationController
  
  #this will go to the create.js.erb file
  def create
    p params[:meme_id]
    if current_user
      # @vote = Vote.where(voter_id: current_user.id, meme_id: params[:meme_id]).first
      @vote = create_or_update_vote
    else
      redirect_to "/auth/google_oauth2"
    end
  end

  private

  def create_or_update_vote
    vote = Vote.where(voter_id: current_user.id, meme_id: params[:meme_id]).first
    if vote
      vote.update_attributes(vote_type: params[:vote_type])
      flash[:notice] = "Your vote has been updated!"
    else
      vote = Vote.create(vote_type: params[:vote_type], voter_id: current_user.id, meme_id: params[:meme_id])
      flash[:notice] = "Your vote has been created!"
    end
    vote
  end

end
