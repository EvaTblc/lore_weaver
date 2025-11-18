class RemoveCharacterNameFromGames < ActiveRecord::Migration[7.2]
  def change
    remove_column :games, :character_name, :string
  end
end
