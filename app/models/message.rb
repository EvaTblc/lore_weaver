class Message < ApplicationRecord
  belongs_to :game

  scope :user_messages, -> { where(role: 'user') }
  scope :assistant_messages, -> { where(role: 'assistant') }

  validates :role, presence: true, inclusion: { in: ["user", "assistant"] }
  validates :content, length: { maximum: 1000 }, if: -> { role == "user" }
  validates :content, length: { maximum: 3000 }, if: -> { role == "assistant" }
end
