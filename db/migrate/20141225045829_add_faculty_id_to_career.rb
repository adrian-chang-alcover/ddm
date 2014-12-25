class AddFacultyIdToCareer < ActiveRecord::Migration
  def up
    add_column :careers, :faculty_id, :integer
  end

  def down
    remove_column :careers, :faculty_id
  end
end
