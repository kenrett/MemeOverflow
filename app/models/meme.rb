class Meme < ActiveRecord::Base
  belongs_to :creator, class_name: "User", foreign_key: "creator_id"
  has_many :votes
  attr_accessible :score, :slug, :url, :creator_id

  before_save :create_slug


  def update_meme_score
    
  end


  private

  def create_slug
    self.slug = SecureRandom.hex(4)
  end
end
