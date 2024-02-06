class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :messages
  has_many :chatrooms
  has_one_attached :photo
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :nickname, presence: true
  validates :email, presence: true
  validates :user_name, presence: true
  validates :bio, presence: true
  validates :password, presence: true, length: { minimum: 6 }, if: :password_required?

  enum status: { online: 'online', away: 'away', offline: 'offline' }

  def password_required?
    new_record? || password.present? || password_confirmation.present?
  end
end
