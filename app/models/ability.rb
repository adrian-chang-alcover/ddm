class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    can :read, :all
    can :manage, :all if user.admin? or user.ddm?

  end
end
