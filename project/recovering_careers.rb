crd = StudyModality.find_by_short_name('CRD')
ed = StudyModality.find_by_short_name('ED')

filosofia = Career.find_by(full_name: 'Filosofía Marxista-Leninista', study_modality_id: ed)
microbiologia = Career.find_by(full_name: 'Microbiología', study_modality_id: ed)

puts filosofia.name
puts microbiologia.name

careers = [filosofia, microbiologia]
careers.each do |c|
  career = Career.find_or_create_by(full_name: c.full_name, faculty: c.faculty, study_modality: crd)
  puts "\t#{career.name}"

  # cloning years and its semesters
  c.years.each do |y|
    year = Year.find_or_create_by(name: y.name, career: career, study_plan: y.study_plan)
    puts "\t\t#{year.pretty_name}"

    y.semesters.each do |s|
      Semester.find_or_create_by(name: s.name, begin_date: s.begin_date, end_date: s.end_date, weeks: s.weeks, year: year)
      puts "\t\t\t#{s.pretty_name}"
    end
  end

  # cloning disciplines
  c.disciplines.each do |d|
    Discipline.find_or_create_by(name: d.name, career: career, number: d.number)
    puts "\t\t#{d.name}"
  end

  # cloning subjects
  puts "Cloning #{c.subjects.count} subjects"
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
