class Dive < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :location, :capacity, :price, :depth_required, :description, presence: true
  validates :depth_required, inclusion: { in: (0..40) }
end
