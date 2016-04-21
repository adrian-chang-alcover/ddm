class AuditsController < ApplicationController
  skip_authorization_check

  # GET /audits
  # GET /audits.json
  def index
    @audits = initialize_grid(PaperTrail::Version.order('id DESC'))
  end

  # GET /audits/1
  # GET /audits/1.json
  def show
    @item = params[:item_type].constantize.find(params[:item_id])
  end    
end
