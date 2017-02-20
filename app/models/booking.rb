class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :dive
  validates :user, :dive, presence: true
  # valider que quantity <= self.dive.capacity ? utiliser callback ?
end
