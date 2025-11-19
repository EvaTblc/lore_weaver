class AddCategoryToScenarios < ActiveRecord::Migration[7.2]
  def change
    add_column :scenarios, :category, :string
  end
end
