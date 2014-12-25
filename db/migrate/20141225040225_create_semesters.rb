class CreateSemesters < ActiveRecord::Migration
  def change
    create_table :semesters do |t|
      t.string :name
      t.integer :year_id
      t.date :begin_date
      t.date :end_date

      t.timestamps
    end
  end
end
