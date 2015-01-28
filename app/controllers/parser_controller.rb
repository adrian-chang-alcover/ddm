class ParserController < ApplicationController
  def ppd_vivo
    if request.get?
      render 'parser/ppd_vivo'
    elsif request.post?
      @subjects = []
      career_id = params['career']
      params['data'].lines.each do |line|
        row = line.chomp.split("\t")
        discipline, subject, foo, class_hours_1, practical_hours, year, semester, curriculum, foo, evaluation = row

        unless discipline.blank?
          discipline = Discipline.find_or_create_by(career_id: career_id, name: discipline)
          @discipline = discipline
        end
        unless year.blank?
          year = Year.find_or_create_by(career_id: career_id, name: year) do |y|
            y.study_plan = STUDY_PLAN_D
          end
        end
        semester = 'unknown' if semester.blank?
        semester = Semester.find_or_create_by(year: year, name: semester)

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
        subject.class_hours_1 = class_hours_1.to_i
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
        number, discipline_or_subject, foo, class_hours_1, practical_hours, ef, tc, first, second, third, fourth, fifth, preparatoria = row

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
            year = [first, second, third, fourth, fifth, preparatoria].find_index{|i| not i.blank?}+1
            year = Year.find_or_create_by(career_id: career_id, name: year) {|y| y.study_plan = STUDY_PLAN_D}
            semester = Semester.find_or_create_by(year: year, name: 'unknown'){|s|s.weeks=16}
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
            subject.class_hours_1 = class_hours_1.to_i
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

  def per_semester
    if request.get?
      render 'parser/per_semester'
    elsif request.post?
      @subjects = []
      career = Career.find(params['career'])
      subjects = params['data'].split("\r\n")
      semester_name = 1
      year_name = 1
      subjects.each_with_index do |line, i|
        if line.chomp.split("\t").count > 1
          subject = line.chomp.split("\t")[0]
          anual = line.chomp.split("\t")[1].strip.chomp == 'ANUAL'
        else
          subject = line.strip.chomp
        end
        if subject.blank? and subjects[i+1].blank?
          year_name += 1
          semester_name = 0
        elsif subject.blank?
          semester_name += 1
        else
          year = Year.find_or_create_by(name: year_name.to_s, career: career)
          semester = Semester.find_or_create_by(name: anual ? 'ANUAL' : semester_name, year: year){|s| s.weeks=16}

          subject = career.subjects.find{|s|I18n.transliterate(s.name).downcase==I18n.transliterate(subject).downcase}
          if subject
            subject.semester = semester
            subject.save
            @subjects << subject
          end
        end
      end
      render 'subjects/_list'
    end
  end
end
