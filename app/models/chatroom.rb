class Chatroom < ApplicationRecord
  has_many :messages, dependent: :destroy
  has_many :users
  has_one_attached :photo
  # has_many :users, through: :messages

  # def active_users_count
  #   users.where('last_active_at > ?', 5.minutes.ago).count
  # end
end
