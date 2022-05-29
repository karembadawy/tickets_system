# == Schema Information
#
# Table name: users
#
#  id                         :bigint           not null, primary key
#  due_date_reminder_interval :integer
#  due_date_reminder_time     :time
#  email                      :string           default(""), not null
#  encrypted_password         :string           default(""), not null
#  name                       :string           not null
#  remember_created_at        :datetime
#  reset_password_sent_at     :datetime
#  reset_password_token       :string
#  send_due_date_reminder     :boolean          default(TRUE), not null
#  time_zone                  :string           default("UTC")
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Associations
  has_many :tickets
  has_many :notifications

  # Validations
  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
  validates :send_due_date_reminder, presence: true
end
