class AddLevelAndExperienceToCharacters < ActiveRecord::Migration[7.2]
  def change
    add_column :characters, :lever, :integer, default: 1
    add_column :characters, :experience, :integer, default: 0
  end
end
