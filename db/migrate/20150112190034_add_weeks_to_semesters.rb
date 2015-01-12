class AddWeeksToSemesters < ActiveRecord::Migration
  def up
    add_column :semesters, :weeks, :integer
  end

  def down
    remove_column :semesters, :weeks
  end
end
