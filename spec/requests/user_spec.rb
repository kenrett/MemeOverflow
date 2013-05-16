require 'spec_helper'
describe 'User' do
  let!(:samsamskies) { create(:user) }
  let!(:sidneythehater) { create(:user) }
  let!(:memebysam) { create(:meme, creator: samsamskies) }

  context "when a user tries to vote" do

    it "can see upvote and downvote buttons"do
      visit root_path
      save_page
      page.should have_selector("button[value='up']")
      page.should have_selector("button[value='down']")
    end

    it "can see the score of a meme" do
      pending
    end

    it "can upvote a meme by clicking the upvote button" do 
      pending
    end

    it "can downvote a meme by clicking the downvote button" do
      pending
    end
  end  
end
