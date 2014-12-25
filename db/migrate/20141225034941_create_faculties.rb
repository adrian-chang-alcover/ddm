class CreateFaculties < ActiveRecord::Migration
  def change
    create_table :faculties do |t|
      t.string :short_name
      t.string :full_name

      t.timestamps
    end
  end
end
