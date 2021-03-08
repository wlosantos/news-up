# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)

    if user
      if user.kind == 'manager'
        can :manage, :all
      end

    end

  end
end
