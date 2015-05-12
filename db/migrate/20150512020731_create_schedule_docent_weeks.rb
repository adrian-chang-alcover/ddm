class CreateScheduleDocentWeeks < ActiveRecord::Migration
  def change
    create_table :schedule_docent_weeks do |t|
      t.integer :number
      t.date :first_day

      t.timestamps
    end
  end
end
