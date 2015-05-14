class Schedule::ScientificDegreesController < ApplicationController
  before_action :set_schedule_scientific_degree, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  respond_to :html

  def index
    @schedule_scientific_degrees = Schedule::ScientificDegree.all
    respond_with(@schedule_scientific_degrees)
  end

  def show
    respond_with(@schedule_scientific_degree)
  end

  def new
    @schedule_scientific_degree = Schedule::ScientificDegree.new
    respond_with(@schedule_scientific_degree)
  end

  def edit
  end

  def create
    @schedule_scientific_degree = Schedule::ScientificDegree.new(scientific_degree_params)
    @schedule_scientific_degree.save
    respond_with(@schedule_scientific_degree)
  end

  def update
    @schedule_scientific_degree.update(scientific_degree_params)
    respond_with(@schedule_scientific_degree)
  end

  def destroy
    @schedule_scientific_degree.destroy
    respond_with(@schedule_scientific_degree)
  end

  private
    def set_schedule_scientific_degree
      @schedule_scientific_degree = Schedule::ScientificDegree.find(params[:id])
    end

    def schedule_scientific_degree_params
      params.require(:schedule_scientific_degree).permit(:short_name, :full_name)
    end
end
