class CreateCareerAccreditations < ActiveRecord::Migration
  def change
    create_table :career_accreditations do |t|
      t.integer :career_id
      t.integer :university_id
      t.integer :year
      t.integer :accreditation_category_id
      t.text :comments

      t.timestamps
    end
  end
end
