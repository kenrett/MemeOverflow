require 'spec_helper'
describe 'User' do
  let!(:samsamskies) { create(:user) }
  let!(:sidneythehater) { create(:user) }
  let!(:memebysam) { create(:meme, creator: samsamskies) }

  context "when a user tries to vote" do

    it "can see upvote and downvote buttons"do
      visit root_path
      page.should have_selector("button[value='up']")
      page.should have_selector("button[value='down']")
    end

    it "can see the score of a meme" do
      visit root_path
      page.should have_selector(".meme-score")
    end

    it "can upvote a meme by clicking the upvote button" do 
      visit root_path
      find(".meme-score").text.should eq "0"
      click_on('up')
      find(".meme-score").text.should eq "1"
    end

    it "can downvote a meme by clicking the downvote button" do
      visit root_path
      find(".meme-score").text.should eq "0"
      click_on('down')
      find(".meme-score").text.should eq "-1"
    end
  end  
end
