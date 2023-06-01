class Flat < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  has_many :bookings

  validates :address, presence: true
  validates :description, presence: true
  validates :price_per_day, presence: true
  validates :price_per_day, numericality: { only_integer: true }
  validates :guests_allowed, presence: true
  validates :guests_allowed, numericality: { only_integer: true }
  validates :city, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
