class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user
    can [:show, :download_document, :download_payment_recipe], User, id: user.id
    if user.admin?
      can :manage, User
      can :manage, Role
      can :manage, Group
    end
  end
end
