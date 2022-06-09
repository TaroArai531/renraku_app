# == Schema Information
#
# Table name: user_boxes
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  box_id     :integer
#  user_id    :integer
#
class UserBox < ApplicationRecord
  belongs_to :user
  belongs_to :box
  validates :user_id, :box_id, presence: true
end
