class CurriculumTypesController < ApplicationController
  before_action :set_curriculum_type, only: [:show, :edit, :update, :destroy]

  # GET /curriculum_types
  # GET /curriculum_types.json
  def index
    @curriculum_types = CurriculumType.all
  end

  # GET /curriculum_types/1
  # GET /curriculum_types/1.json
  def show
  end

  # GET /curriculum_types/new
  def new
    @curriculum_type = CurriculumType.new
  end

  # GET /curriculum_types/1/edit
  def edit
  end

  # POST /curriculum_types
  # POST /curriculum_types.json
  def create
    @curriculum_type = CurriculumType.new(curriculum_type_params)

    respond_to do |format|
      if @curriculum_type.save
        format.html { redirect_to @curriculum_type, notice: 'Curriculum type was successfully created.' }
        format.json { render :show, status: :created, location: @curriculum_type }
      else
        format.html { render :new }
        format.json { render json: @curriculum_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /curriculum_types/1
  # PATCH/PUT /curriculum_types/1.json
  def update
    respond_to do |format|
      if @curriculum_type.update(curriculum_type_params)
        format.html { redirect_to @curriculum_type, notice: 'Curriculum type was successfully updated.' }
        format.json { render :show, status: :ok, location: @curriculum_type }
      else
        format.html { render :edit }
        format.json { render json: @curriculum_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /curriculum_types/1
  # DELETE /curriculum_types/1.json
  def destroy
    @curriculum_type.destroy
    respond_to do |format|
      format.html { redirect_to curriculum_types_url, notice: 'Curriculum type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def model_class
    CurriculumType
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_curriculum_type
      @curriculum_type = CurriculumType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def curriculum_type_params
      params.require(:curriculum_type).permit(:name)
    end
end
