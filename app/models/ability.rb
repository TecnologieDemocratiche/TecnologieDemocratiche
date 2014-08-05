class Ability
  include CanCan::Ability

  def initialize(user)
    if user
      can :show, User, id: user.id
      if user.admin?
        can :manage, User
      end
    end
  end
end
