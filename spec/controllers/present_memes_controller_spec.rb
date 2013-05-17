require 'spec_helper'

describe PresentMemesController do

  describe "GET 'show'" do
    let!(:meme) { create(:meme) }
    let!(:meme2) { create(:meme) }
    it "returns http success" do
      get 'show'
      response.should be_success
    end
  end

end
