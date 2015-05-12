class Schedule::ProfessorsController < ApplicationController
  before_action :set_schedule_professor, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @schedule_professors = Schedule::Professor.all
    respond_with(@schedule_professors)
  end

  def show
    respond_with(@schedule_professor)
  end

  def new
    @schedule_professor = Schedule::Professor.new
    respond_with(@schedule_professor)
  end

  def edit
  end

  def create
    @schedule_professor = Schedule::Professor.new(professor_params)
    @schedule_professor.save
    respond_with(@schedule_professor)
  end

  def update
    @schedule_professor.update(professor_params)
    respond_with(@schedule_professor)
  end

  def destroy
    @schedule_professor.destroy
    respond_with(@schedule_professor)
  end

  private
    def set_schedule_professor
      @schedule_professor = Schedule::Professor.find(params[:id])
    end

    def schedule_professor_params
      params.require(:schedule_professor).permit(:name, :email, :scientific_degree_id, :docent_category_id, :faculty_id)
    end
end
