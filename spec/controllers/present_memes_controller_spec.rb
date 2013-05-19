require 'spec_helper'

describe PresentMemesController do

  describe "GET 'show'" do
    let!(:meme1) { create(:meme) }
    let!(:meme2) { create(:meme) }
    let!(:meme3) { create(:meme) }


    it "returns http success" do
      get 'show'
      response.should be_success
    end



  end

  describe "GET 'next'" do
    let!(:meme1) { create(:meme) }
    let!(:meme2) { create(:meme) }
    let!(:meme3) { create(:meme) }
    let!(:meme4) { create(:meme) }
    let!(:meme5) { create(:meme) }
    
    it "should return a json object with the meme url and id" do
      PresentMemesController.any_instance.stub(:find_next_meme).and_return meme2
      expected = { :url => meme2.url, :id => meme2.id }.to_json
      get :next
      response.body.should eq expected
    end
    it "skips to the next meme when a meme is deleted" do
      PresentMeme.produce_new_order
      # meme1.destroy
      # meme2.destroy
      # meme3.destroy
      get 'next'
      response.should be_success
    end
  end

end
