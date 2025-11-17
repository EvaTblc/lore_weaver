class CreateScenarios < ActiveRecord::Migration[7.2]
  def change
    create_table :scenarios do |t|
      t.string :name, null: false, default: ""
      t.text :description
      t.text :prompt
      t.boolean :active, default: false
      t.timestamps
    end
  end
end
