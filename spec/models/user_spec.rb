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
require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    subject { build(:user) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:password) }
    it { should validate_presence_of(:send_due_date_reminder) }
    it { should validate_uniqueness_of(:email).case_insensitive }
  end

  describe "validation messages" do
    it 'should raise error if email not exist' do
      user = build(:user, email: nil)
      expect(user).to_not be_valid
      expect(user.errors[:email]).to include(I18n.t("errors.messages.blank"))
    end

    it 'should raise error if name not exist' do
      user = build(:user, name: nil)
      expect(user).to_not be_valid
      expect(user.errors[:name]).to include(I18n.t("errors.messages.blank"))
    end

    it 'should raise error if password not exist' do
      user = build(:user, password: '')
      expect(user).to_not be_valid
      expect(user.errors[:password]).to include(I18n.t("errors.messages.blank"))
    end

    it 'should raise error if send_due_date_reminder not exist' do
      user = build(:user, send_due_date_reminder: '')
      expect(user).to_not be_valid
      expect(user.errors[:send_due_date_reminder]).to include(I18n.t("errors.messages.blank"))
    end

    it 'should raise error if email duplicate' do
      first_user = create(:user)
      user = build(:user, email: first_user.email)
      expect(user).to_not be_valid
      expect(user.errors[:email]).to include(I18n.t("errors.messages.taken"))
    end
  end
end
