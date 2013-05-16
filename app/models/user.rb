class User < ActiveRecord::Base
  has_many :memes, foreign_key: "creator_id"
  has_many :votes, foreign_key: "voter_id"
  attr_accessible :auth_status, :email, :full_name, :score, :user_secret, :user_token

  def self.create_with_omniauth(auth)
    create! do |user|
      user.uid = auth["uid"]
      user.full_name = auth["info"]["name"]
      user.email = auth["info"]["email"]
    end
  end

  def update_user_score
    self.score = self.memes.inject(0) { |sum, meme| sum + meme.score }
    self.save
  end
end
