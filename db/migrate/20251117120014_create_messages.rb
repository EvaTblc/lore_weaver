class CreateMessages < ActiveRecord::Migration[7.2]
  def change
    create_table :messages do |t|
      t.string :role
      t.text :content
      t.integer :token_count

      t.references :games, foreign_key: true, null: false
      t.timestamps
    end
  end
end
