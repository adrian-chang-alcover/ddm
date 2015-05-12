class Schedule::GroupsController < ApplicationController
  before_action :set_schedule_group, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @schedule_groups = Schedule::Group.all
    respond_with(@schedule_groups)
  end

  def show
    respond_with(@schedule_group)
  end

  def new
    @schedule_group = Schedule::Group.new
    respond_with(@schedule_group)
  end

  def edit
  end

  def create
    @schedule_group = Schedule::Group.new(group_params)
    @schedule_group.save
    respond_with(@schedule_group)
  end

  def update
    @schedule_group.update(group_params)
    respond_with(@schedule_group)
  end

  def destroy
    @schedule_group.destroy
    respond_with(@schedule_group)
  end

  private
    def set_schedule_group
      @schedule_group = Schedule::Group.find(params[:id])
    end

    def schedule_group_params
      params.require(:schedule_group).permit(:name, :capacity, :year_id)
    end
end
