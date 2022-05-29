# == Schema Information
#
# Table name: notifications
#
#  id         :bigint           not null, primary key
#  text       :text
#  title      :string
#  type       :integer
#  viewed     :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  ticket_id  :bigint
#  user_id    :bigint
#
# Indexes
#
#  index_notifications_on_ticket_id  (ticket_id)
#  index_notifications_on_user_id    (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (ticket_id => tickets.id)
#  fk_rails_...  (user_id => users.id)
#
FactoryBot.define do
  factory :notification do
    title { FFaker::Job.title }
    text { FFaker::Book.description }
    type { Notification.types[:email] }
    viewed { false }
    user
    ticket
  end
end
