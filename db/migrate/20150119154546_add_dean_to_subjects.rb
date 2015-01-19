class AddDeanToSubjects < ActiveRecord::Migration
  def up
    add_column :subjects, :dean, :string
  end

  def down
    remove_column :subjects, :dean
  end
end
