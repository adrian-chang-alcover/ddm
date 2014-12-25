class CreateDisciplines < ActiveRecord::Migration
  def change
    create_table :disciplines do |t|
      t.string :name
      t.integer :career_id

      t.timestamps
    end
  end
end
