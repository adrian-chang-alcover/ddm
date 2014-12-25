class ParserController < ApplicationController
  def ppd_vivo
    career_id = 2
    File.open('project/PPD vivo.txt').readlines.each do |line|
      row = line.chomp.split("\t")
      discipline, subject, foo, class_hours, practical_hours, year, semester, curriculum, foo, evaluation = row

      unless discipline.blank?
        discipline = Discipline.find_or_create_by(career_id: career_id, name: discipline)
        @discipline = discipline
      end
      year = Year.find_or_create_by(career_id: career_id, name: year) unless year.blank?
      semester = Semester.find_or_create_by(year: year, name: semester) unless semester.blank?
      curriculum = CurriculumType.all.find{|ct| ct.name.downcase.gsub(/[^a-z0-9\s]/i, '') == curriculum.downcase.gsub(/[^a-z0-9\s]/i, '')}
      evaluation = EvaluationType.all.find{|et| et.short_name.downcase.gsub(/[^a-z0-9\s]/i, '') == evaluation.downcase.gsub(/[^a-z0-9\s]/i, '')} unless evaluation.blank?

      subject = Subject.find_or_create_by(full_name: subject)
      subject.discipline = @discipline
      subject.semester = semester
      subject.class_hours = class_hours.to_i
      subject.practical_hours = practical_hours.to_i
      subject.curriculum_type = curriculum
      subject.evaluation_type = evaluation
      subject.save
    end
  end
end
