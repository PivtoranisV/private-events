class Event < ApplicationRecord
  belongs_to :creator, class_name: "User"
  has_many :attendances, dependent: :destroy
  has_many :attendees, through: :attendances, source: :user

  validates :title, :description, :date, :location, :category, presence: true
end
