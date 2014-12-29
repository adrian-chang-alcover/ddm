class AlterEvaluationTypeTable < ActiveRecord::Migration
  def up
    rename_column :evaluation_types, :name, :short_name
    add_column :evaluation_types, :full_name, :string
  end

  def down
    rename_column :evaluation_types, :short_name, :name
    remove_column :evaluation_types, :full_name
  end
end
