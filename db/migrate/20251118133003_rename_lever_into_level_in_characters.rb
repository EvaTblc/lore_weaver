class RenameLeverIntoLevelInCharacters < ActiveRecord::Migration[7.2]
  def change
    rename_column :characters, :lever, :level
  end
end
