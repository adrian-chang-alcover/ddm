class UsersController < ApplicationController
  def index
    authorize! :index, :users
    if current_user.admin? or current_user.ddm?
      @users = User.all
    elsif current_user.decano? or current_user.vicedecano?
      @users = current_user.faculty.users
    end
  end

  def toggle_roles
    authorize! :index, :toggle_roles
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

    render nothing: true
  end
end
