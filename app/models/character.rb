class Character < ApplicationRecord
  belongs_to :game
  belongs_to :scenario

  validates :name, presence: true, length: { minimum: 3, maximum: 50 }
  validates :character_class, presence: true
  validates :skills, presence: true
  validate :available_in_scenario
  validate :skills_match_class
  validates :level, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 100 }
  validates :experience, numericality: { only_integer: true }

  def level_up!
    if experience >= xp_next_level
      self.level += 1
      self.experience -= xp_next_level
      skills.each do |key; value|
        skills[key] = value + 1
      end
      save!
    end
  end

  def xp_next_level
    level * 100
  end

  private

  def available_in_scenario
    unless scenario.available_classes&.key?(character_class)
      errors.add(:character_class, "n'est pas disponible pour ce scénario")
    end
  end

  def skills_match_class
    return unless character_class && skills

    expected_keys = scenario.available_classes[character_class]["skills"].keys.sort
    actual_keys = skills.keys.sort

    unless expected_keys == actual_keys
      errors.add(:skills, "ne correspondent pas à la classe #{character_class}")
    end
  end
end
