class Schedule::DocentWeeksController < ApplicationController
  before_action :set_schedule_docent_week, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @schedule_docent_weeks = Schedule::DocentWeek.all
    respond_with(@schedule_docent_weeks)
  end

  def show
    respond_with(@schedule_docent_week)
  end

  def new
    @schedule_docent_week = Schedule::DocentWeek.new
    respond_with(@schedule_docent_week)
  end

  def edit
  end

  def create
    @schedule_docent_week = Schedule::DocentWeek.new(docent_week_params)
    @schedule_docent_week.save
    respond_with(@schedule_docent_week)
  end

  def update
    @schedule_docent_week.update(docent_week_params)
    respond_with(@schedule_docent_week)
  end

  def destroy
    @schedule_docent_week.destroy
    respond_with(@schedule_docent_week)
  end

  private
    def set_schedule_docent_week
      @schedule_docent_week = Schedule::DocentWeek.find(params[:id])
    end

    def schedule_docent_week_params
      params.require(:schedule_docent_week).permit(:number, :first_day, :year_id, :semester_id)
    end
end
