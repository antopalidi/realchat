class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room

  validates :body, presence: true, length: {maximum: 500}

  after_create_commit { broadcast_append_to room }
  before_create :confirm_participant


  # This code is for the future function of sending files in chat:
  #
  # has_many_attached :attachments, dependent: :destroy
  #
  # def chat_attachment(index)
  #   target = attachments[index]
  #   return unless attachments.attached?
  #
  #   if target.image?
  #     target.variant(resize_to_limit: [150, 150])
  #   elsif target.video?
  #     target.variant(resize_to_limit: [150, 150])
  #   end
  # end

  def confirm_participant
    return unless room.is_private

    is_participant = Participant.where(user_id: user.id, room_id: room.id).first
    throw :abort unless is_participant
  end
end
