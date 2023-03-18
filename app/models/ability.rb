class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    if user.admin?
      can :manage, :all # admin can do anything
    else
      can :read, :all # guest user can read everything
      can :manage, Post, author_id: user.id
      can :manage, Comment, author_id: user.id
    end
  end
end
