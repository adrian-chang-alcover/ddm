class AddingStudyModalityColumnToCareerTable < ActiveRecord::Migration
  def up
    add_column :careers, :study_modality_id, :integer
  end

  def down
    remove_column :careers, :study_modality_id
  end
end
