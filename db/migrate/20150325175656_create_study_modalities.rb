class CreateStudyModalities < ActiveRecord::Migration
  def change
    create_table :study_modalities do |t|
      t.string :short_name
      t.string :full_name

      t.timestamps
    end
  end
end
