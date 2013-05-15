class Vote < ActiveRecord::Base
  belongs_to :meme
  belongs_to :voter, class_name: "User", foreign_key: "voter_id"
  attr_accessible :type, :meme_id, :voter_id

  after_create :update_scores

  validates_uniqueness_of :voter_id, :scope => :meme_id

  private

  def update_scores
    self.meme.update_meme_score
    self.voter.update_user_score
  end
  
end
