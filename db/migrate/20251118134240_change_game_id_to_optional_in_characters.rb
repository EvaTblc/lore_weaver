class ChangeGameIdToOptionalInCharacters < ActiveRecord::Migration[7.2]
  def change
    change_column_null :characters, :game_id, true
  end
end
