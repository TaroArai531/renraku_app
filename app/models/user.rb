# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  confirmation_sent_at   :datetime
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  name                   :string(255)
#  picture_content_type   :string(255)
#  picture_file_name      :string(255)
#  picture_file_size      :bigint
#  picture_updated_at     :datetime
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string(255)
#  unconfirmed_email      :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_confirmation_token    (confirmation_token) UNIQUE
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_name                  (name) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  validates :name, presence: true, uniqueness: { case_sensitive: false }

  validates :name, format: { with: /^[a-zA-Z_\s]*$/, multiline: true }
  validate :validate_name

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable

  has_attached_file :picture,
                    style: { medium: '300x300', thumb: '100x100' },
                    default_url: '/default_user_icon.png'

  validates_attachment_content_type :picture, content_type: %r{\Aimage/.*\z}

  attr_accessor :login

  def validate_name
    errors.add(:name, :invalid) if User.exists?(email: name)
  end

  def send_devise_notification(notification, *args)
    devise_mailer.send(notification, self, *args).deliver_later
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    conditions[:email]&.downcase!
    login = conditions.delete(:login)

    where(conditions.to_hash).where(
      [
        'lower(name) = :value OR lower(email) = :value',
        { value: login.downcase },
      ]
    ).first
  end
end
