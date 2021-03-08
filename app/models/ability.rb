# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)

    if user

      if user.kind == 'admin'
        can :access, :rails_admin
        can :manage, :dashboard
        can :manage, :post, user_id: user.id
        can :manage, :friend, friend: user.id
      elsif user.kind == 'manager'
        can :manage, :all
      end

    end

  end
end
