class AddClassHours2toSubjects < ActiveRecord::Migration
  def up
    add_column :subjects, :class_hours_2, :integer
    rename_column :subjects, :class_hours, :class_hours_1
  end

  def down
    remove_column :subjects, :class_hours_2
    rename_column :subjects, :class_hours_1, :class_hours
  end
end
