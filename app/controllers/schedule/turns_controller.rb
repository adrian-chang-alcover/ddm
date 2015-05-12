class Schedule::TurnsController < ApplicationController
  before_action :set_schedule_turn, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @schedule_turns = Schedule::Turn.all
    respond_with(@schedule_turns)
  end

  def show
    respond_with(@schedule_turn)
  end

  def new
    @schedule_turn = Schedule::Turn.new
    respond_with(@schedule_turn)
  end

  def edit
  end

  def create
    @schedule_turn = Schedule::Turn.new(turn_params)
    @schedule_turn.save
    respond_with(@schedule_turn)
  end

  def update
    @schedule_turn.update(turn_params)
    respond_with(@schedule_turn)
  end

  def destroy
    @schedule_turn.destroy
    respond_with(@schedule_turn)
  end

  private
    def set_schedule_turn
      @schedule_turn = Schedule::Turn.find(params[:id])
    end

    def schedule_turn_params
      params.require(:schedule_turn).permit(:name, :start_time, :end_time)
    end
end
