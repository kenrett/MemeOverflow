class User < ActiveRecord::Base
  has_many :memes, foreign_key: "creator_id"
  has_many :votes, foreign_key: "voter_id"
  attr_accessible :auth_status, :email, :full_name, :score, :user_secret, :user_token

  validate :valid_auth_status?

  STATUS = ["user", "admin", "super", "banned", "visitor"]
  def self.create_with_omniauth(auth)
    create! do |user|
      user.uid = auth["uid"]
      user.full_name = auth["info"]["name"]
      user.email = auth["info"]["email"]
    end
  end

  STATUS.each do |status|
    define_method "#{status}?" do
      self.auth_status == status    
    end

    define_method "change_to_#{status}" do
      self.update_attributes(:auth_status => status)
    end
  end

  def update_user_score
    self.update_attributes( :score => self.memes.inject(0) { |sum, meme| sum + meme.score } )
  end

  def valid_auth_status?
    errors.add(:auth_status, "must be a valid status.") unless STATUS.include?(self.auth_status)
  end
end
