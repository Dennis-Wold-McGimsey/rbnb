class Flat < ApplicationRecord

  belongs_to :user
  has_many :bookings


  validates :address, presence: true
  validates :description, presence: true
  validates :price_per_day, presence: true
  validates :price_per_day, numericality: { only_integer: true }
 


end
