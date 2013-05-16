require 'spec_helper'

describe User do
  context 'on score caching' do
    let!(:samsamskies) { create(:user) }
    let!(:sidneythehater) { create(:user) }
    let!(:memebysam) { create(:meme, creator: samsamskies) }  
    it 'updates the user score by one upon upvoting' do
      expect{
        create(:up_vote, :voter => samsamskies, :meme => memebysam )
        }.to change{samsamskies.score}.by(1)
    end

    it 'updates the user score by minus one upon downvoting' do
      expect{
        create(:down_vote, :voter => sidneythehater, :meme => memebysam )
        }.to change{samsamskies.score}.by(-1)
    end
  end
end
