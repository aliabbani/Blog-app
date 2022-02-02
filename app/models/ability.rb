class Ability
  include CanCan::Ability
  def initialize(user)
    # Define abilities for the passed in user here. For example:
    user ||= User.new # guest user (not logged in)
    can :read, :all
    if user.is? :admin
      can :manage, :all
    else
      can :manage, Post, author_id: user.id
      can :manage, Comment, author_id: user.id
      can :manage, :all
      can :read, :all
    end
  end
end
