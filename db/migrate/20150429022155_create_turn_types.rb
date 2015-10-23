class CreateTurnTypes < ActiveRecord::Migration
  def change
    create_table :turn_types do |t|
      t.string :full_name
      t.string :short_name

      t.timestamps
    end
  end
end
