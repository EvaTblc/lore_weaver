class CreateGames < ActiveRecord::Migration[7.2]
  def change
    create_table :games do |t|
      t.string :name, null: false, default: ""
      t.string :status
      t.string :character_name
      t.jsonb :game_state
      t.text :story_summary

      t.references :users, foreign_key: true, null: false
      t.references :scenarios, foreign_key: true, null: false
      t.timestamps
    end
  end
end
