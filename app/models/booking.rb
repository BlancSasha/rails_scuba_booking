class Booking < ApplicationRecord
  belongs_to :user # Renvoie vers les clients (pas le teacher)
  belongs_to :dive
  validate :quantity_cannot_be_greater_than_capacity
  # valider que quantity <= self.dive.capacity ? utiliser callback ?

  def quantity_cannot_be_greater_than_capacity
    errors.add(:quantity, "can't be greater than the capacity") unless quantity <= self.dive.capacity
  end
end
