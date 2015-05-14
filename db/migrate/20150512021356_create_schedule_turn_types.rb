class CreateScheduleTurnTypes < ActiveRecord::Migration
  def change
    create_table :schedule_turn_types do |t|
      t.string :short_name
      t.string :full_name

      t.timestamps
    end
  end
end
