require 'spec_helper'
require 'cancan/matchers'

describe Ability do
  subject { ability }
  let(:ability){ Ability.new(user) }
  let(:user) { nil }
  let(:meme) { create(:meme) }

  context 'visitor privileges' do
    let(:user) { create(:user, :auth_status => 'visitor') }
    it{ should be_able_to(:read, meme)  }
  end

  describe 'user privileges' do
    let(:user) { create(:user) }
    let(:another_user) { create(:user)}
    
    let(:vote) { create(:vote, :meme => meme) }
    let(:admin_vote) { create(:vote, :vote_type => 'admin_up') }
    let(:vote_on_same_meme) { create(:vote, :meme => meme) }

    let(:own_meme) { create(:meme, :creator => user)}
    let(:another_user_meme) { create(:meme)}

    let(:own_vote) { create(:vote, :voter => user)}
    
    context 'meme' do
      it{ should be_able_to(:create, meme) }
      it{ should be_able_to(:destroy, own_meme) }
      it{ should_not be_able_to(:destroy, another_user_meme) }
    end

    context 'vote' do    
      it{ should be_able_to(:create, vote) }
      it{ should be_able_to(:update, own_vote) }
      it{ should_not be_able_to(:create, admin_vote) }
    end

    context 'user' do
      it{ should_not be_able_to(:ban, another_user) }
    end
  end

  context 'admin privileges' do
    let(:user) { create(:admin) }
    let(:another_user) { create(:user) }
    let(:admin_vote) { create(:vote, :vote_type => 'admin_up') }
    let(:own_admin_vote) { create(:vote, :vote_type => 'admin_up', :voter => admin) }
    it{ should be_able_to(:ban, another_user) } 
    it{ should be_able_to(:destroy, meme) }
    it{ should be_able_to(:create, admin_vote) }
  end

  # context 'super privileges' do
  #   let(:super) { create(:super) }
  #   let(:user) { create(:user) }
  #   it{ should be_able_to(:update, user) }    
  # end
  
end
