require 'rails_helper'

RSpec.describe Event, type: :model do
  describe "associations" do
    it { should belong_to(:creator).class_name('User') }
    it { should have_many(:attendances).dependent(:destroy) }
    it { should have_many(:attendees).through(:attendances).source(:user) }
  end

  describe "validations" do
    it { should validate_presence_of(:title) }
    it { should validate_length_of(:title).is_at_most(100) }

    it { should validate_presence_of(:description) }

    it { should validate_presence_of(:date) }
    it "validates that date is not in the past" do
      invalid_event = Event.new(date: Date.yesterday)
      invalid_event.validate
      expect(invalid_event.errors[:date]).to include("cannot be in the past")
    end

    it { should validate_presence_of(:location) }
    it { should validate_length_of(:location).is_at_most(200) }

   it "validates inclusion of category in the allowed list" do
      event = Event.new(
        title: "Sample Event",
        description: "This is a sample description",
        date: Date.tomorrow,
        location: "Sample Location",
        creator: User.new(name: "John Doe", email: "john@example.com", password: "password")
      )

      event.category = "InvalidCategory"
      expect(event).not_to be_valid
      expect(event.errors[:category]).to include("InvalidCategory is not a valid category")

      event.category = "Art"
      expect(event).to be_valid
    end
  end
end
