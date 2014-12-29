class AddStudyPlanToYear < ActiveRecord::Migration
  def up
    add_column :years, :study_plan_id, :integer
  end

  def down
    remove_column :years, :study_plan_id
  end
end
