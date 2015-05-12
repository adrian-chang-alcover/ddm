class CreateScheduleActivities < ActiveRecord::Migration
  def change
    create_table :schedule_activities do |t|
      t.integer :professor_id
      t.integer :subject_id
      t.integer :group_id
      t.integer :local_id
      t.integer :docent_day_id
      t.integer :turn_id
      t.integer :turn_type_id

      t.timestamps
    end
  end
end
