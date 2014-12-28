class CreateStudyPlan < ActiveRecord::Migration
  def change
    create_table :study_plans do |t|
      t.string :name
    end
  end
end
