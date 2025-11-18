class AddInitialGameStateToScenarios < ActiveRecord::Migration[7.2]
  def change
    add_column :scenarios, :initial_game_state, :jsonb
  end
end
