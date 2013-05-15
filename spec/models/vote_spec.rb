require 'spec_helper'

describe Vote do
  context 'on vote creation' do
    let!(:user) { create(:user) }
    let!(:meme) { create(:meme) }
    let!(:upvote) { create( :upvote, :voter => user, :meme => meme ) }
    
    it "the same voter should NOT be able to vote twice on the same meme" do
      build( :upvote, :voter => user , :meme => meme ).should_not be_valid
    end

    it "updates the the score of the meme by one" do
      # # create(:upvote, )



      # second_upvote.should_receive(:meme).and_return true
      # second_upvote.should_receive(:user).and_return true
      # second_upvote = Vote.create(meme_id: 1, voter_id: 2, type: "up")
      # second_upvote.meme.should eq(true)
      # second_upvote.user.should eq(true)
    end
  end
end
