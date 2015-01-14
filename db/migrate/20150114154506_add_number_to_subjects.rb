class AddNumberToSubjects < ActiveRecord::Migration
  def up
    add_column :subjects, :number, :integer
    change_column_default :subjects, :number, 0
    change_column_default :subjects, :class_hours, 0
    change_column_default :subjects, :practical_hours, 0
  end

  def down
    remove_column :subjects, :number
  end
end
