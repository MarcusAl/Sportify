class Court < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :users, through: :bookings
  validates :address, presence: true
  validates :price, presence: true
  has_many_attached :photos
end
