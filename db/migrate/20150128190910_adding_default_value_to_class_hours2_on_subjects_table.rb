class AddingDefaultValueToClassHours2OnSubjectsTable < ActiveRecord::Migration
  def change
    change_column_default :subjects, :class_hours_1, 0
    change_column_default :subjects, :class_hours_2, 0

    Subject.where(class_hours_2: nil).each do |s|
      s.class_hours_2 = 0
      s.save
    end
  end
end
