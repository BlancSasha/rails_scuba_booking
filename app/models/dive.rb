class Dive < ApplicationRecord
  belongs_to :user # Renvoie vers le teacher
  has_many :bookings
  validates :location, :capacity, :price, :depth_required, :description, presence: true
  validates :depth_required, inclusion: { in: (0..40) }
  validate :user_is_a_teacher

  def user_is_a_teacher
    errors.add(:user, "is not a teacher") unless user.teacher == true
  end
end
