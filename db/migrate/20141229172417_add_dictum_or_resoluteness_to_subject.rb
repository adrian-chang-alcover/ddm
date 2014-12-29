class AddDictumOrResolutenessToSubject < ActiveRecord::Migration
  def change
    add_column :subjects, :dictum_or_resoluteness, :string
  end
end
