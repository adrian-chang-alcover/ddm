class CreatingCareersForAllStudyModalities < ActiveRecord::Migration
  def up
    crd = StudyModality.find_by_short_name('CRD')
    StudyModality.where("id != ?", crd.id).each do |modality|
      crd.careers.each do |c|
        career = Career.find_or_create_by(full_name: c.full_name, faculty: c.faculty, study_modality: modality)

        # cloning years and its semesters
        c.years.each do |y|
          year = Year.find_or_create_by(name: y.name, career: career, study_plan: y.study_plan)
          y.semesters.each do |s|
            Semester.find_or_create_by(name: s.name, begin_date: s.begin_date, end_date: s.end_date, weeks: s.weeks, year: year)
          end
        end

        # cloning disciplines
        c.disciplines.each do |d|
          Discipline.find_or_create_by(name: d.name, career: career, number: d.number)
        end

        # cloning subjects
        c.subjects.each do |s|
          year = Year.find_by(name: s.year.name, career: career, study_plan: s.year.study_plan)
          semester = Semester.find_by(name: s.semester.name, year: year)
          discipline = Discipline.find_by(name: s.discipline.name, career: career)
          Subject.find_or_create_by(short_name: s.short_name, full_name: s.full_name, discipline: discipline,
                                    semester: semester, class_hours_1: s.class_hours_1, class_hours_2: s.class_hours_2,
                                    evaluation_type: s.evaluation_type, practical_hours: s.practical_hours,
                                    curriculum_type: s.curriculum_type, dictum_or_resoluteness: s.dictum_or_resoluteness,
                                    number: s.number)
        end
      end
    end
  end
end
