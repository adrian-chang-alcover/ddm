class Schedule::DistributionsController < ApplicationController
  before_action :set_schedule_distribution, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  respond_to :html

  def index
    @schedule_distributions = Schedule::Distribution.all
    respond_with(@schedule_distributions)
  end

  def show
    respond_with(@schedule_distribution)
  end

  def new
    @schedule_distribution = Schedule::Distribution.new
    respond_with(@schedule_distribution)
  end

  def edit
  end

  def create
    @schedule_distribution = Schedule::Distribution.new(distribution_params)
    @schedule_distribution.save
    respond_with(@schedule_distribution)
  end

  def update
    @schedule_distribution.update(distribution_params)
    respond_with(@schedule_distribution)
  end

  def destroy
    @schedule_distribution.destroy
    respond_with(@schedule_distribution)
  end

  private
    def set_schedule_distribution
      @schedule_distribution = Schedule::Distribution.find(params[:id])
    end

    def schedule_distribution_params
      params.require(:schedule_distribution).permit(:professor_id, :group_id, :subject_id)
    end
end
