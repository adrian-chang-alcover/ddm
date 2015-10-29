class InfosController < ApplicationController
  before_action :set_info, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  respond_to :html

  def index
    @infos = Info.all
    respond_with(@infos)
  end

  def show
    respond_with(@info)
  end

  def new
    @info = Info.new
    respond_with(@info)
  end

  def edit
  end

  def create
    @info = Info.new(info_params)
    @info.save
    respond_with(@info)
  end

  def update
    @info.update(info_params)
    respond_with(@info)
  end

  def destroy
    @info.destroy
    respond_with(@info)
  end

  private
    def set_info
      @info = Info.find(params[:id])
    end

    def info_params
      params.require(:info).permit(:title, :description, :user_id, :image)
    end
end
