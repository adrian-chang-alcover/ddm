class Schedule::DocentCategoriesController < ApplicationController
  before_action :set_schedule_docent_category, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @schedule_docent_categories = Schedule::DocentCategory.all
    respond_with(@schedule_docent_categories)
  end

  def show
    respond_with(@schedule_docent_category)
  end

  def new
    @schedule_docent_category = Schedule::DocentCategory.new
    respond_with(@schedule_docent_category)
  end

  def edit
  end

  def create
    @schedule_docent_category = Schedule::DocentCategory.new(docent_category_params)
    @schedule_docent_category.save
    respond_with(@schedule_docent_category)
  end

  def update
    @schedule_docent_category.update(docent_category_params)
    respond_with(@schedule_docent_category)
  end

  def destroy
    @schedule_docent_category.destroy
    respond_with(@schedule_docent_category)
  end

  private
    def set_schedule_docent_category
      @schedule_docent_category = Schedule::DocentCategory.find(params[:id])
    end

    def schedule_docent_category_params
      params.require(:schedule_docent_category).permit(:short_name, :full_name)
    end
end
