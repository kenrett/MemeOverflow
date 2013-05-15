class Vote < ActiveRecord::Base
  belongs_to :meme
  belongs_to :voter, class_name: "User", foreign_key: "voter_id"
  attr_accessible :type

  after_create :update_scores

  def update_scores
    
  end
  
end
