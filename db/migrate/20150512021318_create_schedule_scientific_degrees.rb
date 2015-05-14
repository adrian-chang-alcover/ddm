class CreateScheduleScientificDegrees < ActiveRecord::Migration
  def change
    create_table :schedule_scientific_degrees do |t|
      t.string :short_name
      t.string :full_name

      t.timestamps
    end
  end
end
