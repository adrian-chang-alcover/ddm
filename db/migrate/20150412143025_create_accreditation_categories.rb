class CreateAccreditationCategories < ActiveRecord::Migration
  def change
    create_table :accreditation_categories do |t|
      t.string :name

      t.timestamps
    end
  end
end
