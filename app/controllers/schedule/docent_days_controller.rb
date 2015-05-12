class Schedule::DocentDaysController < ApplicationController
  before_action :set_schedule_docent_day, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  respond_to :html

  def index
    @schedule_docent_days = Schedule::DocentDay.all
    respond_with(@schedule_docent_days)
  end

  def show
    respond_with(@schedule_docent_day)
  end

  def new
    @schedule_docent_day = Schedule::DocentDay.new
    respond_with(@schedule_docent_day)
  end

  def edit
  end

  def create
    @schedule_docent_day = Schedule::DocentDay.new(docent_day_params)
    @schedule_docent_day.save
    respond_with(@schedule_docent_day)
  end

  def update
    @schedule_docent_day.update(docent_day_params)
    respond_with(@schedule_docent_day)
  end

  def destroy
    @schedule_docent_day.destroy
    respond_with(@schedule_docent_day)
  end

  private
    def set_schedule_docent_day
      @schedule_docent_day = Schedule::DocentDay.find(params[:id])
    end

    def schedule_docent_day_params
      params.require(:schedule_docent_day).permit(:day, :docent_week_id)
    end
end
