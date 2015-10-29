class CreateDynamicNews < ActiveRecord::Migration
  def change
    create_table :dynamic_news do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
