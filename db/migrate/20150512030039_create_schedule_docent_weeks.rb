class CreateScheduleDocentWeeks < ActiveRecord::Migration
  def change
    create_table :schedule_docent_weeks do |t|
      t.integer :number
      t.date :first_day
      t.integer :year_id
      t.integer :semester_id

      t.timestamps
    end
  end
end
