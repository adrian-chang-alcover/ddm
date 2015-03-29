class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    can :read, :all
    can :manage, :all if user.admin? or user.ddm?

    if user.decano? or user.vicedecano? or user.ppd?
      can :update, Discipline, :career => {:faculty_id => user.faculty_id}
      can :update, Semester, :year => {:career => {:faculty_id => user.faculty_id}}
      can :update, Subject, :discipline => {:career => {:faculty_id => user.faculty_id}}
      can :update, Year, :career => {:faculty_id => user.faculty_id}
    end

    if user.jefe_de_carrera?
      can :update, Discipline, :career => user.career_id
      can :update, Semester, :year => {:career => user.career_id}
      can :update, Subject, :discipline => {:career => user.career_id}
      can :update, Year, :career => user.career_id
    end

    cannot :manage, :activities unless user.admin?
    cannot :manage, :parser unless user.admin?
    cannot :manage, :users unless user.admin? or user.ddm? or user.decano? or user.vicedecano?
  end
end
