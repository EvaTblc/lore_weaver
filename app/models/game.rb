class Game < ApplicationRecord
  has_many :messages

  belongs_to :user
  belongs_to :scenario

  enum status: { active: "active", completed: "completed", abandoned: "abandoned" }

  validates :name, uniqueness: { scope: :user_id }
  validates :character_name, presence: true, length: { minimum: 2, maximum: 20 }
end
