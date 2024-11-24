require 'rails_helper'

RSpec.describe User, type: :model do
  describe "associations" do
    it { should have_many(:created_events).class_name('Event').with_foreign_key('creator_id') }
    it { should have_many(:attendances) }
    it { should have_many(:attended_events).through(:attendances).source(:event) }
  end

  describe "validations" do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
  end

  describe "Devise modules" do
    it "is database authenticatable" do
      user = User.create(email: "test@example.com", password: "password")
      expect(user.valid_password?("password")).to be true
    end

    it "is not valid with an incorrect password" do
      user = User.create(email: "test@example.com", password: "password")
      expect(user.valid_password?("wrong_password")).to be false
    end
  end
end
