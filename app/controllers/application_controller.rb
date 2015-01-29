class ApplicationController < ActionController::Base
  include PublicActivity::StoreController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!, except: [:index, :show]

  CURRICULUM_TYPE_BASICO = CurriculumType.find_or_create_by(name: 'Básico')
  CURRICULUM_TYPE_PROPIO = CurriculumType.find_or_create_by(name: 'Propio')
  CURRICULUM_TYPE_OPTATIVO = CurriculumType.find_or_create_by(name: 'Optativo Electivo')

  EVALUATION_TYPE_EXAMEN_FINAL = EvaluationType.find_or_create_by(short_name: 'EF'){|et| et.full_name = 'Exámen Final'}
  EVALUATION_TYPE_TRABAJO_CURSO = EvaluationType.find_or_create_by(short_name: 'TC'){|et| et.full_name = 'Trabajo de Curso'}

  STUDY_PLAN_D = StudyPlan.find_or_create_by(name: 'D')

end
