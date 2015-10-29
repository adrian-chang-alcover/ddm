class DynamicNewsController < ApplicationController
  before_action :set_dynamic_news, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @dynamic_news = DynamicNew.all
    respond_with(@dynamic_news)
  end

  def show
    respond_with(@dynamic_news)
  end

  def new
    @dynamic_news = DynamicNew.new
    respond_with(@dynamic_news)
  end

  def edit
  end

  def create
    @dynamic_news = DynamicNew.new(dynamic_new_params)
    @dynamic_news.save
    respond_with(@dynamic_news)
  end

  def update
    @dynamic_news.update(dynamic_new_params)
    respond_with(@dynamic_news)
  end

  def destroy
    @dynamic_news.destroy
    respond_with(@dynamic_news)
  end

  private
    def set_dynamic_news
      @dynamic_news = DynamicNew.find(params[:id])
    end

    def dynamic_news_params
      params.require(:dynamic_news).permit(:title, :description)
    end
end
