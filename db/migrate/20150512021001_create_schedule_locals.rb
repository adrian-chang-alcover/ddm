class CreateScheduleLocals < ActiveRecord::Migration
  def change
    create_table :schedule_locals do |t|
      t.string :name
      t.integer :capacity
      t.integer :faculty_id

      t.timestamps
    end
  end
end
