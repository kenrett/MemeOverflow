class Meme < ActiveRecord::Base
  belongs_to :creator, class_name: "User", foreign_key: "creator_id"
  has_many :votes
  attr_accessible :score, :slug, :url, :creator_id, :creator

  before_save :create_slug


  def update_meme_score
    self.score = calculate_point
    self.save!
  end


  private

  def create_slug
    self.slug = SecureRandom.hex(4)
  end
  
  def calculate_score
    points = calculate_point
    time_since_submission_in_hours = (Time.now - self.created_at) / 3600
    gravity = 0.5
    (points - 1) / (time_since_submission_in_hours + 2) ** gravity
  end

  def calculate_point
    votes.up_votes.count - votes.down_votes.count    
  end
end
