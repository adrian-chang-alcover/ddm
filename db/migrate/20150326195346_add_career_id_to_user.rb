class AddCareerIdToUser < ActiveRecord::Migration
  def up
  	add_column :users, :career_id, :integer
  end

  def down
  	remove_column :users, :career_id
  end	
end
