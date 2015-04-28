class CreateCareerUniversity < ActiveRecord::Migration
  def change
    create_table :careers_universities do |t|
    	t.belongs_to :career
    	t.belongs_to :university
    end
  end
end
