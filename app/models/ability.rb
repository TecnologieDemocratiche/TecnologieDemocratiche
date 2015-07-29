class Ability
  include CanCan::Ability

  def initialize(user)
    if user
      can :show, User, id: user.id
      can :manage, User if user.admin?
    end
  end
end
