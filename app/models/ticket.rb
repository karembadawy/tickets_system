# == Schema Information
#
# Table name: tickets
#
#  id          :bigint           not null, primary key
#  description :text
#  due_date    :datetime
#  progress    :integer          default(0), not null
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
class Ticket < ApplicationRecord
  # Enumerations
  enum status: [:pending, :assigned, :solved]

  # Associations
  belongs_to :user
  has_many :notifications

  # Validations
  validates :title, presence: true
  validates :status, presence: true
  validates :progress, presence: true
end
