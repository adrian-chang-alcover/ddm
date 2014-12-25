class RenameColumnsAtSubjectsTable < ActiveRecord::Migration
  def up
    rename_column :subjects, :descipline_id, :discipline_id
  end

  def down
    rename_column :subjects, :discipline_id, :descipline_id
  end
end
