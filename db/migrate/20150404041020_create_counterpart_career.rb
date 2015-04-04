class CreateCounterpartCareer < ActiveRecord::Migration
  def change
    create_table :counterpart_careers do |t|
      t.belongs_to :career_id
      t.belongs_to :university_id
    end
  end
end
