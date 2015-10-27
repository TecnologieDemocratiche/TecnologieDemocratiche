class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user
    can [:show, :download_document, :download_payment_recipe], User, id: user.id
    return unless user.admin?
    can :manage, User
    can :manage, Role
    can :manage, Group
  end
end
