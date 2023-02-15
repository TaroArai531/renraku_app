# == Schema Information
#
# Table name: newsletters
#
#  id         :bigint           not null, primary key
#  title      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
class Newsletter < ApplicationRecord
  belongs_to :user
  has_one_attached :letter
end
