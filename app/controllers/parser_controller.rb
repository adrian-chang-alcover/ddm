class ParserController < ApplicationController
  def ppd_vivo
    if request.get?
      render 'parser/ppd_vivo'
    elsif request.post?
      @subjects = []
      career_id = params['career']
      params['data'].lines.each do |line|
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

        subject = Subject.find_or_create_by(discipline: @discipline, full_name: subject)
        subject.discipline = @discipline
        subject.semester = semester
        subject.class_hours = class_hours.to_i
        subject.practical_hours = practical_hours.to_i
        subject.curriculum_type = curriculum
        subject.evaluation_type = evaluation
        subject.save
        @subjects << subject
      end

      render 'subjects/_list'
    end
  end

  def ppd
    if request.get?
      render 'parser/ppd'
    elsif request.post?
      @subjects = []
      career_id = params['career']
      params['data'].lines.each do |line|
        row = line.chomp.split("\t")
        number, discipline_or_subject, foo, class_hours, practical_hours, ef, tc, first, second, third, fourth, fifth = row

        if (number = number.to_f) > 0
          if number == number.to_i
            discipline = Discipline.find_or_create_by(career_id: career_id, name: discipline_or_subject)
            @discipline = discipline
          else
            year = [first, second, third, fourth, fifth].find_index{|i| not i.blank?}+1
            year = Year.find_or_create_by(career_id: career_id, name: year)
            semester = Semester.find_or_create_by(year: year, name: 1)
            evaluation_type = if ef.to_i > 0
                                'EF'
                              elsif tc.to_i > 0
                                'TC'
                              else
                                nil
                              end
            evaluation_type = EvaluationType.find_by_short_name(evaluation_type)

            subject = Subject.find_or_create_by(discipline: @discipline, full_name: discipline_or_subject)
            subject.discipline = @discipline
            subject.semester = semester
            subject.class_hours = class_hours.to_i
            subject.practical_hours = practical_hours.to_i
            subject.evaluation_type = evaluation_type
            subject.save
            @subjects << subject
          end
        end
      end

      render 'subjects/_list'
    end
  end
end
