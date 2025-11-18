class AddAvailableClassesToScenarios < ActiveRecord::Migration[7.2]
  def change
    add_column :scenarios, :available_classes, :jsonb
  end
end
