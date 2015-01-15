class AddNumberToDisciplines < ActiveRecord::Migration
  def up
    add_column :disciplines, :number, :integer
    change_column_default :disciplines, :number, 0
  end

  def down
    remove_column :disciplines, :number
  end
end
