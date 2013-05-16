class User < ActiveRecord::Base
  has_many :memes, foreign_key: "creator_id"
  has_many :votes, foreign_key: "voter_id"
  attr_accessible :auth_status, :email, :full_name, :score, :user_secret, :user_token

  # validate :valid_auth_status

  def self.create_with_omniauth(auth)
    create! do |user|
      user.uid = auth["uid"]
      user.full_name = auth["info"]["name"]
      user.email = auth["info"]["email"]
    end
  end

  def super?
    self.auth_status == "super"    
  end

  def admin?
    self.auth_status == "admin"
  end

  def user?
    self.auth_status == "user"
  end

  def banned?
    self.auth_status == "banned"
  end

  def update_user_score
    self.score = self.memes.inject(0) { |sum, meme| sum + meme.score }
    self.save
  end

  def self.promote_to_admin(user)
    user.auth_status = "admin"
    user.save
  end

  def self.demote_to_user(user)
    user.auth_status = "user"
    user.save
  end

  def self.ban(user)
    user.auth_status = "banned"
    user.save
  end

  # def valid_auth_status
  #   unless self.auth_status ==  "user" || "admin" || "super" || "banned"
  #     errors.add(:auth_status, "must be a valid status.")
  #   end
  # end
end
