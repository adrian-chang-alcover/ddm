class CreateScheduleDocentDays < ActiveRecord::Migration
  def change
    create_table :schedule_docent_days do |t|
      t.date :day
      t.integer :docent_week_id

      t.timestamps
    end
  end
end
