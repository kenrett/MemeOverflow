class User < ActiveRecord::Base
  has_many :memes, foreign_key: "creator_id"
  has_many :votes, foreign_key: "voter_id"
  attr_accessible :auth_status, :email, :full_name, :score, :user_secret, :user_token

  def update_user_score
    
  end
end
