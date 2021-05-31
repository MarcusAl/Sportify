class Booking < ApplicationRecord
  belongs_to :court
  belongs_to :user
  validates :date, presence: true
end
