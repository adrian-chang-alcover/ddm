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
        curriculum = case curriculum
                       when 'BÁSICO'
                         CURRICULUM_TYPE_BASICO
                       when 'PROPIO'
                         CURRICULUM_TYPE_PROPIO
                       when 'OPTATIVO/ELECTIVO'
                         CURRICULUM_TYPE_OPTATIVO
                       end
        evaluation = case evaluation
                       when 'EF'
                         EVALUATION_TYPE_EXAMEN_FINAL
                       when 'TC'
                         EVALUATION_TYPE_TRABAJO_CURSO
                       else
                         nil
                     end

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

        case number
          when 'CURRÍCULO BÁSICO'
            @curriculum_type = CURRICULUM_TYPE_BASICO
          when 'CURRÍCULO PROPIO'
            @curriculum_type = CURRICULUM_TYPE_PROPIO
          when 'CURRÍCULO OPTATIVO'
            @curriculum_type = CURRICULUM_TYPE_OPTATIVO
        end
        if (number = number.to_f) > 0
          if number == number.to_i
            discipline = Discipline.find_or_create_by(career_id: career_id, name: discipline_or_subject)
            @discipline = discipline
          else
            year = [first, second, third, fourth, fifth].find_index{|i| not i.blank?}+1
            year = Year.find_or_create_by(career_id: career_id, name: year)
            semester = Semester.find_or_create_by(year: year, name: 1)
            evaluation_type = if ef.to_i > 0
                                EVALUATION_TYPE_EXAMEN_FINAL
                              elsif tc.to_i > 0
                                EVALUATION_TYPE_TRABAJO_CURSO
                              else
                                nil
                              end

            subject = Subject.find_or_create_by(discipline: @discipline, full_name: discipline_or_subject)
            subject.discipline = @discipline
            subject.semester = semester
            subject.class_hours = class_hours.to_i
            subject.practical_hours = practical_hours.to_i
            subject.evaluation_type = evaluation_type
            subject.curriculum_type = @curriculum_type
            subject.save
            @subjects << subject
          end
        end
      end

      render 'subjects/_list'
    end
  end
end
