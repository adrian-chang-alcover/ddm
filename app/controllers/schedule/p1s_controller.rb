class Schedule::P1sController < ApplicationController
  before_action :set_schedule_p1, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  respond_to :html

  def index
    @schedule_p1s = Schedule::P1.all
    respond_with(@schedule_p1s)
  end

  def show
    respond_with(@schedule_p1)
  end

  def new
    @schedule_p1 = Schedule::P1.new
    respond_with(@schedule_p1)
  end

  def edit
  end

  def create
    @schedule_p1 = Schedule::P1.new(p1_params)
    @schedule_p1.save
    respond_with(@schedule_p1)
  end

  def update
    @schedule_p1.update(p1_params)
    respond_with(@schedule_p1)
  end

  def destroy
    @schedule_p1.destroy
    respond_with(@schedule_p1)
  end

  private
    def set_schedule_p1
      @schedule_p1 = Schedule::P1.find(params[:id])
    end

    def schedule_p1_params
      params.require(:schedule_p1).permit(:subject_id, :docent_week_id, :turn_type_id, :name, :number)
    end
end
