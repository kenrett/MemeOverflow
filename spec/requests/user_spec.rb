require 'spec_helper'

describe 'User' do
  let!(:samsamskies) { create(:user) }
  let!(:sidneythehater) { create(:user) }
  let!(:memebysam) { create(:meme, creator: samsamskies) }

  context "when a user tries to vote", :js=>true do
    it "can see upvote and downvote buttons"do
      stub_current_user(samsamskies)
      visit root_path
      page.should have_selector("button[value='up']")
      page.should have_selector("button[value='down']")
    end

    it "can see the score of a meme" do
      stub_current_user(samsamskies)
      visit root_path
      page.should have_selector(".meme-score")
    end

    it "gets redirected to google by clicking on the google sign in button" do
      visit root_path
      find("#google-login-button").click
      page.should have_selector(".signin-box")
      page.should have_content("Sign in ")
      page.should have_selector(".google-header-bar")
    end

    it "gets redirected to google if not logged in and tries to vote" do    
      visit root_path
      first('button', :text => "Upvote").click
      page.should have_selector(".signin-box")
      page.should have_content("Sign in ")
      page.should have_selector(".google-header-bar")
    end

    it "can upvote a meme if logged in by clicking the upvote button" do 
      stub_current_user(samsamskies)
      visit root_path
      first(".meme-score").text.should eq "0"
      first('button', :text => "Upvote").click
      first(".meme-score").text.should eq "1"
    end

    it "can downvote a meme if logged in by clicking the downvote button" do
      stub_current_user(samsamskies)
      visit root_path
      save_page
      first(".meme-score").text.should eq "0"
      first('button', :text => "Downvote").click
      first(".meme-score").text.should eq "-1"
    end
  end  
end
