class CreateScheduleProfessors < ActiveRecord::Migration
  def change
    create_table :schedule_professors do |t|
      t.string :name
      t.string :email
      t.integer :scientific_degree_id
      t.integer :docent_category_id
      t.integer :faculty_id

      t.timestamps
    end
  end
end
