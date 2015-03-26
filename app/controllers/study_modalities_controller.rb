class StudyModalitiesController < ApplicationController
  before_action :set_study_modality, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  respond_to :html

  def index
    @study_modalities = StudyModality.all
    respond_with(@study_modalities)
  end

  def show
    respond_with(@study_modality)
  end

  def new
    @study_modality = StudyModality.new
    respond_with(@study_modality)
  end

  def edit
  end

  def create
    @study_modality = StudyModality.new(study_modality_params)
    @study_modality.save
    respond_with(@study_modality)
  end

  def update
    @study_modality.update(study_modality_params)
    respond_with(@study_modality)
  end

  def destroy
    @study_modality.destroy
    respond_with(@study_modality)
  end

  private
    def set_study_modality
      @study_modality = StudyModality.find(params[:id])
    end

    def study_modality_params
      params.require(:study_modality).permit(:short_name, :full_name)
    end
end
