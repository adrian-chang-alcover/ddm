class AlterSubjectsTable < ActiveRecord::Migration
  def up
    rename_column :subjects, :hours, :class_hours
    add_column :subjects, :practical_hours, :integer
  end

  def down
    rename_column :subjects, :class_hours, :hours
    remove_column :subjects, :practical_hours
  end
end
