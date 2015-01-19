class AddDeanToFaculty < ActiveRecord::Migration
  def up
    add_column :faculties, :dean, :string
  end

  def down
    remove_column :faculties, :dean
  end
end
