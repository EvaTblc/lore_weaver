class Message < ApplicationRecord
  belongs_to :game

  validates :role, presence: true, inclusion: { in: ["user", "assistant"] }
  validates :content, length: { maximum: 1000 }
end
