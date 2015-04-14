class CareerAccreditationsController < ApplicationController
  before_action :set_career_accreditation, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  respond_to :html

  def index
    @career_accreditations = CareerAccreditation
    @career_accreditations = CareerAccreditation.where(career_id: params[:career_filter]) unless params[:career_filter].blank?
    @career_accreditations = CareerAccreditation.where(university_id: params[:university_filter]) unless params[:university_filter].blank?
    @career_accreditations = CareerAccreditation.where(year: params[:year_filter]) unless params[:year_filter].blank?
    @career_accreditations = CareerAccreditation.where(accreditation_category_id: params[:accreditation_category_filter]) unless params[:accreditation_category_filter].blank?

    unless params[:sort_by].blank?
      @career_accreditations = @career_accreditations.order("#{params[:sort_by]} #{params[:asc] == 'true' ? 'ASC' : 'DESC'}").page(params[:page]).per(25)
    else
      @career_accreditations = @career_accreditations.page(params[:page]).per(25)
    end

    respond_with(@career_accreditations)
  end

  def show
    respond_with(@career_accreditation)
  end

  def new
    @career_accreditation = CareerAccreditation.new
    respond_with(@career_accreditation)
  end

  def edit
  end

  def create
    @career_accreditation = CareerAccreditation.new(career_accreditation_params)
    @career_accreditation.save
    respond_with(@career_accreditation)
  end

  def update
    @career_accreditation.update(career_accreditation_params)
    respond_with(@career_accreditation)
  end

  def destroy
    @career_accreditation.destroy
    respond_with(@career_accreditation)
  end

  private
    def set_career_accreditation
      @career_accreditation = CareerAccreditation.find(params[:id])
    end

    def career_accreditation_params
      params.require(:career_accreditation).permit(:career_id, :university_id, :year, :accreditation_category_id, :comments)
    end
end
