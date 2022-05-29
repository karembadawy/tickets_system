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
require 'rails_helper'

RSpec.describe Notification, type: :model do
  describe "associations" do
    subject { build(:notification) }
    it { should belong_to(:user) }
    it { should belong_to(:ticket) }
  end
end
