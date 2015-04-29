class TurnTypesController < ApplicationController
  before_action :set_turn_type, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @turn_types = TurnType.all
    respond_with(@turn_types)
  end

  def show
    respond_with(@turn_type)
  end

  def new
    @turn_type = TurnType.new
    respond_with(@turn_type)
  end

  def edit
  end

  def create
    @turn_type = TurnType.new(turn_type_params)
    @turn_type.save
    respond_with(@turn_type)
  end

  def update
    @turn_type.update(turn_type_params)
    respond_with(@turn_type)
  end

  def destroy
    @turn_type.destroy
    respond_with(@turn_type)
  end

  private
    def set_turn_type
      @turn_type = TurnType.find(params[:id])
    end

    def turn_type_params
      params.require(:turn_type).permit(:full_name, :short_name)
    end
end
