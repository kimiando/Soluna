class Chatroom < ApplicationRecord
  has_many :messages, dependent: :destroy
  has_many :users
  belongs_to :pages
  has_one_attached :photo
  # has_many :users, through: :messages
end
