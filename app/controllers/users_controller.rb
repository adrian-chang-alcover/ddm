class UsersController < ApplicationController
  def index
    @users = User.all if current_user.admin? or current_user.ddm?
    @users = current_user.faculty.users if current_user.decano? or current_user.vicedecano?
  end

  def roles
  end
end
