class Vote < ActiveRecord::Base
  belongs_to :meme
  belongs_to :voter, class_name: "User", foreign_key: "voter_id"
  attr_accessible :vote_type, :meme_id, :voter_id

  before_save :downcase_vote_type
  after_save :update_scores

  validates_uniqueness_of :voter_id, :scope => :meme_id

  scope :up_votes, where(vote_type: "up")
  scope :down_votes, where(vote_type: "down")
  scope :admin_up_votes, where(vote_type: "admin_up")
  scope :admin_down_votes, where(vote_type: "admin_down")


  def update_scores
    self.meme.update_meme_score
    self.meme.creator.update_user_score
    # p self.id
    # VotesWorker.perform_async(self.id)
  end

  def downcase_vote_type
    self.vote_type = vote_type.downcase
  end

end
