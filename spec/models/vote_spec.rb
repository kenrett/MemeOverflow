 require 'spec_helper'

describe Vote do
  context 'on vote creation' do
    let!(:user) { create(:user) }
    let!(:sidneythehater) { create(:user) }
    let!(:meme) { create(:meme) }    
    let!(:up_vote) { create( :up_vote, :voter => user, :meme => meme ) }

    it "downcases the vote type before saving;" do
      create(:vote, :vote_type => "Up").vote_type.should eq "up"
    end 

    it "the same voter should NOT be able to vote twice on the same meme" do
      build( :up_vote, :voter => user , :meme => meme ).should_not be_valid
    end
  end
end

