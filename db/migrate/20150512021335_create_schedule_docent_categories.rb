class CreateScheduleDocentCategories < ActiveRecord::Migration
  def change
    create_table :schedule_docent_categories do |t|
      t.string :short_name
      t.string :full_name

      t.timestamps
    end
  end
end
