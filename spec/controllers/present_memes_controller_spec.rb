require 'spec_helper'

describe PresentMemesController do

  describe "GET 'show'" do
    let!(:meme) { create(:meme) }
    it "returns http success" do
      get 'show'
      response.should be_success
    end
  end

  describe "GET 'next'" do
    let!(:meme) { create(:meme) }
    let!(:meme2) { create(:meme) }
    it "should return a json object with the meme url and id" do
      PresentMemesController.any_instance.stub(:find_next_meme).and_return meme2
      expected = { :url => meme2.url, :id => meme2.id }.to_json
      get :next
      response.body.should eq expected
    end
  end
end
