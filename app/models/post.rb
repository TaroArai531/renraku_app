# == Schema Information
#
# Table name: posts
#
#  id            :bigint           not null, primary key
#  bathroom      :string(255)
#  bathroom_time :datetime
#  comment       :text(65535)
#  date          :date
#  pick_up       :string(255)
#  pick_up_time  :datetime
#  sleep         :datetime
#  temperature   :float(24)
#  wake_up       :datetime
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  box_id        :integer
#  user_id       :integer
#
class Post < ApplicationRecord
  belongs_to :user
  belongs_to :box
  validates :user_id, :box_id, presence: true
end
