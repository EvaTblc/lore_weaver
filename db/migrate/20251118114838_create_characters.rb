class CreateCharacters < ActiveRecord::Migration[7.2]
  def change
    create_table :characters do |t|
      t.references :game, null: false, foreign_key: true
      t.references :scenario, null: false, foreign_key: true
      t.string :name
      t.string :character_class
      t.jsonb :skills

      t.timestamps
    end
  end
end
