class Meme < ActiveRecord::Base
  belongs_to :creator, class_name: "User", foreign_key: "creator_id"
  has_many :votes
  attr_accessible :score, :slug, :url, :creator_id, :creator

  before_create :to_slug


  def update_meme_score
    self.score = self.votes.count
  end


  private

  def to_slug
    self.slug = SecureRandom.hex(4)
  end
end
