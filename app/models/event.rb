class Event < ApplicationRecord
  belongs_to :creator, class_name: "User"

  validates :title, :description, :date, :location, :category, presence: true
end
