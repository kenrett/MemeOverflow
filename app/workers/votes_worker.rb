class VotesWorker

  include Sidekiq::Worker
  sidekiq_options queue: "high"
  sidekiq_options retry: false
  
  def perform(vote_id)
    vote = Vote.find(vote_id)
    vote.update_scores
  end

end
