require 'spec_helper'

describe Meme do
  let!(:samsamskies) { create(:user) }
  let!(:memebysam) { create(:meme, creator: samsamskies) }
  context 'on user creation' do
    it "creates a randomly generated slug" do
      memebysam.slug.length.should eq(8) 
    end
  end

  context 'on score caching' do
    it 'updates the meme score by one upon voting' do
      expect{
        create(:upvote, :voter => samsamskies, :meme => memebysam )
        }.to change{memebysam.score}.by(1)
      end
    end
  end
