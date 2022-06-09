# == Schema Information
#
# Table name: messages
#
#  id         :bigint           not null, primary key
#  content    :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  room_id    :integer
#  user_id    :integer
#
class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room
  validates :user_id, :room_id, presence: true
  validates :content, presence: true, length: { maximum: 250 }
end
