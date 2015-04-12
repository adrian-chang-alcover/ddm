class AccreditationCategoriesController < ApplicationController
  before_action :set_accreditation_category, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  respond_to :html

  def index
    @accreditation_categories = AccreditationCategory.all
    respond_with(@accreditation_categories)
  end

  def show
    respond_with(@accreditation_category)
  end

  def new
    @accreditation_category = AccreditationCategory.new
    respond_with(@accreditation_category)
  end

  def edit
  end

  def create
    @accreditation_category = AccreditationCategory.new(accreditation_category_params)
    @accreditation_category.save
    respond_with(@accreditation_category)
  end

  def update
    @accreditation_category.update(accreditation_category_params)
    respond_with(@accreditation_category)
  end

  def destroy
    @accreditation_category.destroy
    respond_with(@accreditation_category)
  end

  private
    def set_accreditation_category
      @accreditation_category = AccreditationCategory.find(params[:id])
    end

    def accreditation_category_params
      params.require(:accreditation_category).permit(:name)
    end
end
