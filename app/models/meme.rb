class Meme < ActiveRecord::Base
  belongs_to :creator, class_name: "User", foreign_key: "creator_id"
  has_many :votes
  # has_many :votes_by_user, :where =>
  attr_accessible :score, :slug, :url, :creator_id, :creator

  before_create :create_slug

  scope :latest, lambda{ |latest_count| order("created_at DESC").limit(latest_count) }

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

  def self.memes_to_show
    latest = Meme.latest(20)
    popular_without_latest = Meme.order("score DESC").limit(20).where("id NOT IN (:ids)", :ids => latest.map(&:id))

    (latest.map(&:id) + popular_without_latest.map(&:id) ).shuffle.join(";")
    
    #(Meme.latest_20_meme_ids + Meme.popular_memes_not_including_latest_20_meme_ids)
  end
  
  def self.latest_20_meme_ids
    Meme.latest_20_memes.pluck(:id)
  end

  def self.popular_memes_not_including_latest_20_meme_ids
    Meme.all_except_latest_20_memes.sort_by { |meme| meme.score }.reverse.first(20).map { |meme| meme.id }
  end
end
