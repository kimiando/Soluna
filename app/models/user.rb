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

  # new-relation for invitaions
  has_many :invitations
  has_many :pending_invitations, -> { where confirmed: false }, class_name: 'Invitation', foreign_key: 'friend_id'

  def friends
    friends_i_sent_invitation = Invitation.where(user_id: id, confirmed: true).pluck(:friend_id)
    friends_i_got_invitation = Invitation.where(user_id: id, confirmed: true).pluck(:user_id)
    ids = friends_i_sent_invitation + friends_i_got_invitation
    User.where(id: ids)
  end

  def friend_with?(user)
    Invitation.confirmed_record?(id, user.id)
  end

  def send_invitation(user)
    invitation = invitations.find_or_initialize_by(friend: user)
    invitation.update(confirmed: false)
    invitation
  end

  def password_required?
    new_record? || password.present? || password_confirmation.present?
  end
end
