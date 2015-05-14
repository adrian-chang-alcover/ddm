class CreateScheduleP1s < ActiveRecord::Migration
  def change
    create_table :schedule_p1s do |t|
      t.integer :subject_id
      t.integer :docent_week_id
      t.integer :turn_type_id
      t.string :name
      t.integer :number

      t.timestamps
    end
  end
end
