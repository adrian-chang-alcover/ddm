class AddingStudyModalities < ActiveRecord::Migration
  def up
    StudyModality.find_or_create_by(short_name: 'CRD'){|sm| sm.full_name = 'Curso Regular Diurno'}
    StudyModality.find_or_create_by(short_name: 'CPE'){|sm| sm.full_name = 'Curso por Encuentros'}
    StudyModality.find_or_create_by(short_name: 'CCE'){|sm| sm.full_name = 'Curso Continuidad de Estudios'}
    StudyModality.find_or_create_by(short_name: 'ED'){|sm| sm.full_name = 'Educación a Distancia'}
  end

  def down
    StudyModality.find_by(short_name: 'CRD').delete
    StudyModality.find_by(short_name: 'CPE').delete
    StudyModality.find_by(short_name: 'CCE').delete
    StudyModality.find_by(short_name: 'ED').delete
  end
end
