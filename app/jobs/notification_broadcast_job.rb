class NotificationBroadcastJob < ApplicationJob
  queue_as :default

  def perform(notification)
    # Do something later
  end
end
