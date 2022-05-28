# == Schema Information
#
# Table name: tickets
#
#  id          :bigint           not null, primary key
#  description :text
#  due_date    :datetime
#  status      :integer          default("pending"), not null
#  title       :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint
#
# Indexes
#
#  index_tickets_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
FactoryBot.define do
  factory :ticket do
    title { FFaker::Job.title }
    description { FFaker::Book.description }
    status { Ticket.statuses[:pending] }
    user
  end
end
