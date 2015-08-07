class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user
    can [:show, :download_document, :download_payment_recipe], User, id: user.id
    can :manage, User if user.admin?
  end
end
