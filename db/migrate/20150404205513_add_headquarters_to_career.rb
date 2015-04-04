class AddHeadquartersToCareer < ActiveRecord::Migration
  def change
    add_column :careers, :headquarters, :boolean
  end
end
