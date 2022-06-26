class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :messages

  mount_uploader :avatar, AvatarUploader

  enum status: %i[offline away online]

  scope :all_except, -> (user) { where.not(id: user) }

  after_create_commit { broadcast_append_to 'users' }

  after_update_commit { broadcast_update }

  validates :username, uniqueness: true, length: {minimum: 3, maximum: 15}

  def broadcast_update
    broadcast_replace_to 'user_status', partial: 'users/status', user: self
  end

  def status_to_css
    case status
    when 'offline'
      'online_icon offline'
    when 'online'
      'online_icon'
    when 'away'
      'online_icon bg-warning'
    else
      'bg-dark'
    end
  end
end
