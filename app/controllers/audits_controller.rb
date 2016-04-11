class AuditsController < ApplicationController
  before_action :set_audit, only: [:show, :edit, :update, :destroy]
  skip_authorization_check

  # GET /audits
  # GET /audits.json
  def index
    @audits = initialize_grid(PaperTrail::Version)
  end

  # GET /audits/1
  # GET /audits/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_audit
      @audit = PaperTrail::Version.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def audit_params
      params.require(:audit).permit(:item_type, :item_id, :event, :whodunnit, :object)
    end
end
