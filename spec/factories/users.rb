# == Schema Information
#
# Table name: users
#
#  id                         :bigint           not null, primary key
#  due_date_reminder_interval :integer
#  due_date_reminder_time     :datetime
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
FactoryBot.define do
  factory :user do
    email { FFaker::Internet.email }
    password { FFaker::Internet.password }
    name { FFaker::Name.name }
    send_due_date_reminder { true }
  end
end
