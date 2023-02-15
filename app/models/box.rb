# == Schema Information
#
# Table name: boxes
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Box < ApplicationRecord
  has_many :users, through: :user_boxes
  has_many :user_boxes, dependent: :destroy
  has_many :posts, dependent: :destroy
end
