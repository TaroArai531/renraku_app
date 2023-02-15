# == Schema Information
#
# Table name: user_rooms
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  room_id    :integer
#  user_id    :integer
#
class UserRoom < ApplicationRecord
  belongs_to :user
  belongs_to :room
  validates :user_id, :room_id, presence: true
end
