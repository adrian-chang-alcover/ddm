class CreateUniversity < ActiveRecord::Migration
  def change
    create_table :universities do |t|
      t.string :short_name
      t.string :full_name
    end
  end
end
