class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :games
  has_many :messages, through: :games

  validates :username, presence: true, uniqueness: true, length: { minimum: 3 }

  def all_messages
    Message.joins(:game).where(games: {user_id: id})
  end
end
