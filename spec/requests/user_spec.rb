require 'spec_helper'
describe 'User' do
  let!(:samsamskies) { create(:user) }
  let!(:sidneythehater) { create(:user) }
  let!(:memebysam) { create(:meme, creator: samsamskies) }
  Capybara.server_port = 3000
  Capybara.app_host = "http://localhost:3000"
  
  before do 
    request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:google]

    # request.env["devise.mapping"] = Devise.mappings[:user] 
    # request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:twitter] 
  end

  context "when a user tries to vote", :js=>true do

    # it "can see upvote and downvote buttons"do
    #   visit root_path
    #   page.should have_selector("button[value='up']")
    #   page.should have_selector("button[value='down']")
    # end

    # it "can see the score of a meme" do
    #   visit root_path
    #   page.should have_selector(".meme-score")
    # end

    it "gets redirected to google if not logged in and tries to vote" do
      # visit('/auth/google_oauth2/callback')
      visit root_path
      click_link("login")
      # save_page
      # fill_in 'Email', with: 'binaryskipper@gmail.com'
      # fill_in 'Passwd', with: 'dbcmemes'
      # click_button 'signIn'
      # click_button 'submit_approve_access'
      save_page
      first('button', :text => "Upvote").click
      # the above link is routing to the wrong page
    end


    # it "can upvote a meme if logged in by clicking the upvote button" do 
    #   visit root_path
    #   first(".meme-score").text.should eq "0"
    #   first('button', :text => "Upvote").click
    #   first(".meme-score").text.should eq "1"
    # end

    # it "can downvote a meme if logged in by clicking the downvote button" do
    #   visit root_path
    #   first(".meme-score").text.should eq "0"
    #   first('button', :text => "Downvote").click
    #   first(".meme-score").text.should eq "-1"
    # end
  end  
end
