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

  context 'authorization level' do
    it "user has auth_status of user on creation" do
      create(:user).auth_status.should eq("user")
    end

    it 'User#admin?' do
      create(:admin).admin?.should eq(true)
      create(:user).admin?.should eq(false)
    end

    it "User#user?" do
      create(:user).user?.should eq(true)
      create(:admin).user?.should eq(false)
    end

    it "User#super?" do
      create(:super).super?.should eq(true)
      create(:user).super?.should eq(false)
    end

    it "User#banned?" do
      banned_user = create(:user)
      banned_user.auth_status == "banned"
      banned_user.save
      banned_user.reload
      banned_user.banned?.should eq(false)
    end

    it "does not allow users to be assigned with invalid auth_status" do
      build(:user, :auth_status => "God").should_not be_valid
    end
  end

  context 'can change auth_status of other users' do
    let!(:peasant) { create(:user) }
    let!(:king) { create(:admin) }  
    let!(:trouble_maker) { create(:user) }
    it "can promote another user to be an admin" do      
      peasant.change_to_admin
      peasant.reload
      peasant.admin?.should eq(true)
    end

    it "can demote another admin to be an user" do
      king.change_to_user
      king.reload
      king.user?.should eq(true)
    end

    it "can ban user" do
      trouble_maker.change_to_banned
      trouble_maker.reload
      trouble_maker.banned?.should eq(true)
    end
  end
end
