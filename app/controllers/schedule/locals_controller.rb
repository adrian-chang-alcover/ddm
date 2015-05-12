class Schedule::LocalsController < ApplicationController
  before_action :set_schedule_local, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @schedule_locals = Schedule::Local.all
    respond_with(@schedule_locals)
  end

  def show
    respond_with(@schedule_local)
  end

  def new
    @schedule_local = Schedule::Local.new
    respond_with(@schedule_local)
  end

  def edit
  end

  def create
    @schedule_local = Schedule::Local.new(local_params)
    @schedule_local.save
    respond_with(@schedule_local)
  end

  def update
    @schedule_local.update(local_params)
    respond_with(@schedule_local)
  end

  def destroy
    @schedule_local.destroy
    respond_with(@schedule_local)
  end

  private
    def set_schedule_local
      @schedule_local = Schedule::Local.find(params[:id])
    end

    def schedule_local_params
      params.require(:schedule_local).permit(:name, :capacity, :faculty_id)
    end
end
