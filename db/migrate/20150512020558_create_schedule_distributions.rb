class CreateScheduleDistributions < ActiveRecord::Migration
  def change
    create_table :schedule_distributions do |t|
      t.integer :professor_id
      t.integer :group_id
      t.integer :subject_id

      t.timestamps
    end
  end
end
