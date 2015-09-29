class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    cannot :manage, :all
    can :manage, :all if user.admin? or user.ddm?
    can :read, :all if user.decano? or user.vicedecano?

    cannot :manage, :activities unless user.admin?
    cannot :manage, :parser unless user.admin?
    cannot :manage, :users unless user.admin?
  end
end
