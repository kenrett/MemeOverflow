class VotesWorker

  include Sidekiq::Worker
  # sidekiq_options queue: "high"
  sidekiq_options retry: false
  
  def perform(vote_id)
    p "performing vote worker task"
    p vote_id
    vote = Vote.find(vote_id)
    vote.meme.update_meme_score
    vote.meme.creator.update_user_score
  end

end
