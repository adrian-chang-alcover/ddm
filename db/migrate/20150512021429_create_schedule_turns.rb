class CreateScheduleTurns < ActiveRecord::Migration
  def change
    create_table :schedule_turns do |t|
      t.string :name
      t.time :start_time
      t.time :end_time

      t.timestamps
    end
  end
end
