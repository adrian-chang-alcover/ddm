class ApplicationController < ActionController::Base
  include PublicActivity::StoreController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!, except: [:index, :show]
  before_action :configure_permitted_parameters, if: :devise_controller?
  check_authorization

  before_action :record_visit

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

  CURRICULUM_TYPE_BASICO = CurriculumType.find_or_create_by(name: 'Básico')
  CURRICULUM_TYPE_PROPIO = CurriculumType.find_or_create_by(name: 'Propio')
  CURRICULUM_TYPE_OPTATIVO = CurriculumType.find_or_create_by(name: 'Optativo Electivo')

  EVALUATION_TYPE_EXAMEN_FINAL = EvaluationType.find_or_create_by(short_name: 'EF'){|et| et.full_name = 'Exámen Final'}
  EVALUATION_TYPE_TRABAJO_CURSO = EvaluationType.find_or_create_by(short_name: 'TC'){|et| et.full_name = 'Trabajo de Curso'}

  STUDY_PLAN_D = StudyPlan.find_or_create_by(name: 'D')

  ACCREDITATION_CATEGORY_EXCELENCIA = AccreditationCategory.find_or_create_by(name: 'Carrera de Excelencia')
  ACCREDITATION_CATEGORY_CERTIFICADA = AccreditationCategory.find_or_create_by(name: 'Carrera Certificada')
  ACCREDITATION_CATEGORY_AUTORIZADA = AccreditationCategory.find_or_create_by(name: 'Carrera Autorizada')

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up).concat([:username, :faculty_id, :career_id])
    devise_parameter_sanitizer.for(:account_update).concat([:username, :faculty_id, :career_id])
  end

  def record_visit
    visit = VisitCounter.new
    visit.ip = request.ip
    visit.url = request.url
    visit.user_id = current_user.id if current_user
    visit.save
  end

end
