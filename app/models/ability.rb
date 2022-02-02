# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, :all
    return unless user.present?

    can :manage, Post, author_id: user.id
    can :manage, Comment, author_id: user.id
    can :manage, Like, author_id: user.id
    
    can :manage, :all
  end
end
