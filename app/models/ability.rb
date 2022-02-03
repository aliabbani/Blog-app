class Ability
  include CanCan::Ability
  def initialize(user)
    # Define abilities for the passed in user here. For example:
    can :read, Post
    can :read, Comment
    can :read, User
    can :read, Like
    return unless user.present?

    can :manage, Post, author_id: user.id
    can :manage, Comment, author_id: user.id
    can :manage, Like, author_id: user.id
    return unless user.admin?

    can :manage, :all
  end
end
