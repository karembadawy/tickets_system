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
class Notification < ApplicationRecord
  # Enumerations
  enum type: [:email]

  # Callbacks
  after_commit :notify_user, on: :create

  # Associations
  belongs_to :user
  belongs_to :ticket

  # Private Methods
  private

  def notify_user
    NotificationBroadcastJob.perform_later(self)
  end
end
