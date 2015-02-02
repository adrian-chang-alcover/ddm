class UsersController < ApplicationController
  def index
    @users = User.all if current_user.admin? or current_user.ddm?
    @users = current_user.faculty.users if current_user.decano? or current_user.vicedecano?
  end

  def toggle_roles
    @user = User.find(params['user'])
    render status: :forbidden unless current_user.admin? or current_user.ddm? or current_user.decano? or current_user.vicedecano?
    render status: :forbidden unless current_user.admin? or current_user.ddm? or current_user.faculty == user.faculty

    if params['role']
      role = Role.find(params['role'])
      render status: :forbidden unless role.priority > current_user.priority
      if @user.roles.include?(role)
        @user.roles.delete(role)
      else
        @user.roles << role
      end
    end

    render :partial => 'toggle_roles'
  end
end
