class Chatroom < ApplicationRecord
  has_many :messages, dependent: :destroy
  has_many :users
  has_one_attached :photo
  # has_many :users, through: :messages
end
