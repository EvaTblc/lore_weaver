class RemoveAddReferencesToMessages < ActiveRecord::Migration[7.2]
  def change
    remove_reference :messages, :games, foreign_key: true
    add_reference :messages, :game, foreign_key: true
  end
end
