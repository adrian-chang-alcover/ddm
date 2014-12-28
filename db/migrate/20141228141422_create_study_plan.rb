class CreateStudyPlan < ActiveRecord::Migration
  def up
    create_table :study_plans do |t|
      t.string :name

      t.timestamps
    end
  end

  def down
    drop_table :study_plans
  end
end
