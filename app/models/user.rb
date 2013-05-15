class User < ActiveRecord::Base
  attr_accessible :auth_status, :email, :full_name, :score, :user_secret, :user_token
end
