class StudyPlansController < ApplicationController
  before_action :set_study_plan, only: [:show, :edit, :update, :destroy]

  # GET /study_plans
  # GET /study_plans.json
  def index
    @study_plans = StudyPlan.all
  end

  # GET /study_plans/1
  # GET /study_plans/1.json
  def show
  end

  # GET /study_plans/new
  def new
    @study_plan = StudyPlan.new
  end

  # GET /study_plans/1/edit
  def edit
  end

  # POST /study_plans
  # POST /study_plans.json
  def create
    @study_plan = StudyPlan.new(study_plan_params)

    respond_to do |format|
      if @study_plan.save
        format.html { redirect_to @study_plan, notice: 'Study plan was successfully created.' }
        format.json { render :show, status: :created, location: @study_plan }
      else
        format.html { render :new }
        format.json { render json: @study_plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /study_plans/1
  # PATCH/PUT /study_plans/1.json
  def update
    respond_to do |format|
      if @study_plan.update(study_plan_params)
        format.html { redirect_to @study_plan, notice: 'Study plan was successfully updated.' }
        format.json { render :show, status: :ok, location: @study_plan }
      else
        format.html { render :edit }
        format.json { render json: @study_plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /study_plans/1
  # DELETE /study_plans/1.json
  def destroy
    @study_plan.destroy
    respond_to do |format|
      format.html { redirect_to study_plans_url, notice: 'Study plan was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def model_class
    StudyPlan
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_study_plan
      @study_plan = StudyPlan.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def study_plan_params
      params.require(:study_plan).permit(:name)
    end
end
