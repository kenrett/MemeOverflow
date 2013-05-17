class Ability
  include CanCan::Ability

  def initialize(user)
    alias_action :ban, :change_status ,:promote_to_admin, :to => :super

    user ||= User.new(auth_status: "visitor")
    if user.super?
      can :manage, :all
      can :super, User
    elsif user.admin?
      can :manage, :all
      can :ban, User
    elsif user.user?
      can :read, :all
      can :create, :all

      can :destroy, Meme, :creator => user
      can :update, Vote, :voter_id => user.id

      cannot :create, Vote, :vote_type => "admin_up"
      cannot :create, Vote, :vote_type => "admin_down"

      cannot :ban, User
    else
      can :read, :all
    end
  end
end
