class RemoveReferencesToGames < ActiveRecord::Migration[7.2]
  def change
    remove_reference :games, :users
    remove_reference :games, :scenarios
  end
end
