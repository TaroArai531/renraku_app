# == Schema Information
#
# Table name: rooms
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Room < ApplicationRecord
  has_many :users, through: :user_rooms
  has_many :user_rooms, dependent: :destroy
  has_many :messages, dependent: :destroy
end
