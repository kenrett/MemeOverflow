class Meme < ActiveRecord::Base
  belongs_to :creator, class_name: "User", foreign_key: "creator_id"
  has_many :votes
  attr_accessible :score, :slug, :url

  before_create :to_slug


  def update_meme_score
    
  end


  private

  def to_slug
    
  end
end
