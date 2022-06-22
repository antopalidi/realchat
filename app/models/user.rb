class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :messages
  has_one_attached :avatar

  enum status: %i[offline away online]

  scope :all_except, -> (user) { where.not(id: user) }

  after_create_commit { broadcast_append_to 'users' }

  after_update_commit { broadcast_update }

  after_commit :add_default_avatar, on: %i[create update]

  validates :avatar, presence: true

  def avatar_thumbnail
    avatar.variant(resize_to_limit: [150, 150])
  end

  def chat_avatar
    avatar.variant(resize_to_limit: [50, 50])
  end

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

  private

  def add_default_avatar
    return if avatar.attached?

    avatar.attach(
      io: File.open(Rails.root.join('app', 'assets', 'images', 'default_avatar.jpg')),
      filename: 'default_avatar.jpg',
      content_type: 'image/jpg'
    )
  end
end
