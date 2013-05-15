FactoryGirl.define do
  factory :user, :aliases => [:voter, :creator] do
    full_name 'ed shadi'
    sequence(:email) {|n| "email-#{n}-#{Time.now.to_i}@example.com"  }
  end

  factory :meme do
    url "http://google.com"
    creator
  end

  factory :vote, :aliases => [:up_vote] do
    voter
    meme
    vote_type "up"
  end

  factory :down_vote, :parent => :vote do
    vote_type "down"
  end
end
