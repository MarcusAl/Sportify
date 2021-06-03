class Court < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :users, through: :bookings
  validates :address, presence: true
  validates :price, presence: true
  has_many_attached :photos
  validates :category, inclusion: { in: %w[Indoor Outdoor] }
  validates :surfaces, inclusion: { in: %w[Clay Hardcore Grass Concrete] }
  searchkick
  def search_data
    {

      address: address,
      price: price.to_s

    }
  end
end
