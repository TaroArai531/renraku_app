# == Schema Information
#
# Table name: bulletins
#
#  id         :bigint           not null, primary key
#  content    :text(65535)
#  title      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
class Bulletin < ApplicationRecord
  belongs_to :user
  has_one_attached :file
end
