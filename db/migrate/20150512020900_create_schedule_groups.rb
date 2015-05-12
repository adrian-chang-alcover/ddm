class CreateScheduleGroups < ActiveRecord::Migration
  def change
    create_table :schedule_groups do |t|
      t.string :name
      t.integer :capacity
      t.integer :year_id

      t.timestamps
    end
  end
end
