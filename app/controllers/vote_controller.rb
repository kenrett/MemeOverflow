class VoteController < ApplicationController
  def create
    p params[:vote_type]
    p params[:id]
  end

  def update
  end
end
