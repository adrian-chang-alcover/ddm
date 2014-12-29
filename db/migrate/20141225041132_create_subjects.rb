class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.string :short_name
      t.string :full_name
      t.integer :descipline_id
      t.integer :semester_id
      t.integer :hours
      t.integer :evaluation_type_id

      t.timestamps
    end
  end
end
