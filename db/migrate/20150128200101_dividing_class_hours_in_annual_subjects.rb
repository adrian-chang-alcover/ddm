class DividingClassHoursInAnnualSubjects < ActiveRecord::Migration
  def change
    Subject.all.select{|s| s.semester.anual? and s.class_hours_2 == 0}.each do |s|
      s.class_hours_2 = s.class_hours_1/2
      s.class_hours_1 = s.class_hours_1/2
      s.save
    end
  end
end
