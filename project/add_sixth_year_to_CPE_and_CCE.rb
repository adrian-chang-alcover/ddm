cpe = StudyModality.find_by(short_name: 'CPE')
cce = StudyModality.find_by(short_name: 'CCE')

d = StudyPlan.find_by(name: 'D')

[cpe, cce].each do |sm|
	sm.careers.each do |career|
		year = Year.find_or_create_by(name: '6', career: career, study_plan: d)
		puts year.pretty_name_with_career
	end
end