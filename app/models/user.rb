class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :messages

  scope :all_except, -> (user) { where.not(id: user) }

  after_create_commit { broadcast_append_to 'users' }
end
