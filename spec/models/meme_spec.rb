require 'spec_helper'

describe Meme do 
  context "on upload" do
    # let!(:user) { User.create(full_name: 'Stephen Nguyen', email: 's@g.com') }
    let!(:meme) { Meme.new(url: 'http://www.example.com', creator_id: 1) }

    it "should change slug from nil to 8 character securerandom" do
      meme.save
      meme.slug.length.should eq(8)
    end

    it "shouldn't have a slug before create" do
      meme.slug.should eq(nil)
    end
  end
end


