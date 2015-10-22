class DashboardController < ApplicationController
  skip_authorization_check	
  def index
  	@pending_requested_tasks = initialize_grid(TasksManagement::Task.where(requester: current_user).where.not(state: TasksManagement::Task.states['accepted']))
    @accepted_requested_tasks = initialize_grid(TasksManagement::Task.where(requester: current_user, state: TasksManagement::Task.states['accepted']))
  	@own_tasks = initialize_grid(TasksManagement::Task.where(owner: current_user))
  end

  def request_task
  	@task = TasksManagement::Task.new(requester: current_user)
  	@task.pending!
  	@task.medium!
  end

  def start_task
  	task = TasksManagement::Task.find(params['task'])
  	task.start!
  	redirect_to :back
  end

  def finish_task
  	task = TasksManagement::Task.find(params['task'])
  	task.finish!
  	redirect_to :back
  end

  def accept_task
  	task = TasksManagement::Task.find(params['task'])
  	task.accept!
  	redirect_to :back
  end

  def reject_task
  	task = TasksManagement::Task.find(params['task'])
  	task.reject!
  	redirect_to :back
  end
end
