class Game < ApplicationRecord
  has_many :messages
  has_one :character, dependent: :destroy

  belongs_to :user
  belongs_to :scenario

  enum status: { active: "active", completed: "completed", abandoned: "abandoned" }

  validates :name, uniqueness: { scope: :user_id }

  def counter_messages_ai
    messages.assistant_messages.count
  end

  def counter_messages_user
    messages.user_messages.count
  end

  def last_activity
    messages.last&.created_at
  end

  def total_play_time
    if messages.any?
      messages.last&.created_at - messages.first&.created_at
    else
      0
    end
  end

  def apply_changes(changes)
    game_state["health"] += changes["health"] if changes["health"]
    game_state["gold"] += changes["gold"] if changes["gold"]

    if changes["inventory"]
      changes["inventory"].each do |item|
        if item.start_with?("-")
          game_state["inventory"].delete(item[1..])
        else
          game_state["inventory"] << item
        end
      end
    end

    if changes["experience"]
      character.experience += changes["experience"]
      character.level_up!
    end

    save!
  end
end
