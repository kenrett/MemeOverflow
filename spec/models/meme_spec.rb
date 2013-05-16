require 'spec_helper'

describe Meme do
  let!(:samsamskies) { create(:user) }
  let!(:sidneythehater) { create(:user) }
  let!(:memebysam) { create(:meme, creator: samsamskies) }

  context 'on user creation' do
    it "creates a randomly generated slug" do
      memebysam.slug.length.should eq(8) 
    end
  end


  describe "#update_meme_score" do
    it "updates the score the the value of calculate_score" do
      new_score = 500
      meme = create(:meme)
      meme.stub(:calculate_score).and_return new_score

      meme.update_meme_score
      
      meme.reload
      meme.score.should == new_score
    end
  end

  context "on upload" do

    it "should have slug with 8 characters" do
      memebysam.slug.length.should eq(8)
    end

    it "should have a url" do
      memebysam.url.should_not eq(nil)
    end
  end
end



