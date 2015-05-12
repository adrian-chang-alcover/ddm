class Schedule::TurnTypesController < ApplicationController
  before_action :set_schedule_turn_type, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @schedule_turn_types = Schedule::TurnType.all
    respond_with(@schedule_turn_types)
  end

  def show
    respond_with(@schedule_turn_type)
  end

  def new
    @schedule_turn_type = Schedule::TurnType.new
    respond_with(@schedule_turn_type)
  end

  def edit
  end

  def create
    @schedule_turn_type = Schedule::TurnType.new(turn_type_params)
    @schedule_turn_type.save
    respond_with(@schedule_turn_type)
  end

  def update
    @schedule_turn_type.update(turn_type_params)
    respond_with(@schedule_turn_type)
  end

  def destroy
    @schedule_turn_type.destroy
    respond_with(@schedule_turn_type)
  end

  private
    def set_schedule_turn_type
      @schedule_turn_type = Schedule::TurnType.find(params[:id])
    end

    def schedule_turn_type_params
      params.require(:schedule_turn_type).permit(:short_name, :full_name)
    end
end
