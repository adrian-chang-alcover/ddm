class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  CURRICULUM_TYPE_BASICO = CurriculumType.first
  CURRICULUM_TYPE_PROPIO = CurriculumType.second
  CURRICULUM_TYPE_OPTATIVO = CurriculumType.third

  EVALUATION_TYPE_EXAMEN_FINAL = EvaluationType.first
  EVALUATION_TYPE_TRABAJO_CURSO = EvaluationType.second

  STUDY_PLAN_D = StudyPlan.first
end
