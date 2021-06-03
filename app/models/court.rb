class Court < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :users, through: :bookings
  validates :address, presence: true
  validates :price, presence: true
  has_many_attached :photos
  validates :category, inclusion: { in: %w(Indoor Outdoor) }
  validates :surfaces, inclusion: { in: %w(Clay Hardcore Grass Concrete) }
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  searchkick
end
