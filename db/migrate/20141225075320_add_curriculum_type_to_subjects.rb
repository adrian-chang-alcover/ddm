class AddCurriculumTypeToSubjects < ActiveRecord::Migration
  def up
    add_column :subjects, :curriculum_type_id, :integer
  end

  def down
    remove_column :subjects, :curriculum_type_id
  end
end
