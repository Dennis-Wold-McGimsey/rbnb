class Flat < ApplicationRecord
  belongs_to :user, optional: true
  validates :address, presence: true
  validates :description, presence: true
  validates :price_per_day, presence: true

end
