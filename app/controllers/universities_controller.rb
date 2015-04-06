class UniversitiesController < ApplicationController
  before_action :set_university, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  respond_to :html

  def index
    @universities = University.all
    respond_with(@universities)
  end

  def show
    respond_with(@university)
  end

  def new
    @university = University.new
    respond_with(@university)
  end

  def edit
  end

  def create
    @university = University.new(university_params)
    @university.save
    respond_with(@university)
  end

  def update
    @university.update(university_params)
    respond_with(@university)
  end

  def destroy
    @university.destroy
    respond_with(@university)
  end

  private
    def set_university
      @university = University.find(params[:id])
    end

    def university_params
      params.require(:university).permit(:short_name, :full_name)
    end
end
