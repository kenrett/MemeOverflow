require 'spec_helper'

describe Vote do
  context 'on vote creation' do
    let!(:user) { create(:user) }
    let!(:sidneythehater) { create(:user) }
    let!(:meme) { create(:meme) }    
    let!(:up_vote) { create( :up_vote, :voter => user, :meme => meme ) }

    it "downcases the vote type before saving;" do
      pending
    end 

    it "the same voter should NOT be able to vote twice on the same meme" do
      build( :up_vote, :voter => user , :meme => meme ).should_not be_valid
    end
  end
end


  # context 'on score caching' do
  #   it 'updates the meme score by one upon upvoting' do
  #     expect{
  #       create(:up_vote, :voter => samsamskies, :meme => memebysam )
  #       }.to change{memebysam.score}.by(1)
  #   end

  #   it 'updates the meme score by minus one upon downvoting' do
  #     expect{
  #       create(:down_vote, :voter => sidneythehater, :meme => memebysam )
  #       }.to change{memebysam.score}.by(-1)
  #   end
  # end
