class CreateVisitCounters < ActiveRecord::Migration
  def change
    create_table :visit_counters do |t|
      t.string :username
      t.string :ip
      t.string :url

      t.timestamps
    end
  end
end
