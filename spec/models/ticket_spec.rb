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
require 'rails_helper'

RSpec.describe Ticket, type: :model do
  describe "validations" do
    subject { build(:ticket) }
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:status) }
  end

  describe "associations" do
    subject { build(:ticket) }
    it { should belong_to(:user) }
  end

  describe "validation messages" do
    it 'should raise error if title not exist' do
      user = build(:ticket, title: nil)
      expect(user).to_not be_valid
      expect(user.errors[:title]).to include(I18n.t("errors.messages.blank"))
    end

    it 'should raise error if status not exist' do
      user = build(:ticket, status: nil)
      expect(user).to_not be_valid
      expect(user.errors[:status]).to include(I18n.t("errors.messages.blank"))
    end
  end
end
