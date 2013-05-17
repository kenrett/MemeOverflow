class Meme < ActiveRecord::Base
  belongs_to :creator, class_name: "User", foreign_key: "creator_id"
  has_many :votes
  attr_accessible :score, :slug, :url, :creator_id, :creator

  before_create :create_slug

  scope :latest_20_memes, order("created_at DESC").limit(20)

  def self.cache_scores
    puts "whenever run"
  end

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
    votes.up_votes.count - votes.down_votes.count + calculate_admin_point
  end

  def calculate_admin_point
    (votes.admin_up_votes.count * rand(25) )  - (votes.admin_down_votes.count * rand(25) )
  end
end
