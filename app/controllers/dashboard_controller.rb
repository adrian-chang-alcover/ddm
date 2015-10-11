class DashboardController < ApplicationController
	skip_authorization_check	
  def index
  	@requested_tasks = initialize_grid(TasksManagement::Task.where(requester: current_user))
  end
end
