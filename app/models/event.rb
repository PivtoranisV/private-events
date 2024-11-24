class Event < ApplicationRecord
  belongs_to :creator, class_name: "User"
  has_many :attendances, dependent: :destroy
  has_many :attendees, through: :attendances, source: :user

  validates :title, presence: true, length: { maximum: 100 }
  validates :description, presence: true
  validates :date, presence: true, comparison: { greater_than_or_equal_to: Date.today, message: "cannot be in the past" }
  validates :location, presence: true, length: { maximum: 200 }
  validates :category, presence: true, inclusion: { in: [ "Art", "Music", "Education", "Other" ], message: "%{value} is not a valid category" }
end
