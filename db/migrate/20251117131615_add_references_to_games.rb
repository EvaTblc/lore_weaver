class AddReferencesToGames < ActiveRecord::Migration[7.2]
  def change
    add_reference :games, :user, foreign_key: true
    add_reference :games, :scenario, foreign_key: true
  end
end
