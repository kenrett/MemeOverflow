class Vote < ActiveRecord::Base
  belongs_to :meme
  belongs_to :voter, class_name: "User", foreign_key: "voter_id"
  attr_accessible :vote_type, :meme_id, :voter_id

  after_save :update_scores

  validates_uniqueness_of :voter_id, :scope => :meme_id

  scope :up_votes, where(vote_type: "up")
  scope :down_votes, where(vote_type: "down")
  scope :admin_up_votes, where(vote_type: "admin_up")
  scope :admin_down_votes, where(vote_type: "admin_down")


  def update_scores
    p self.id
    VotesWorker.perform_async(self.id)
  end

end
