class Dive < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :location, :capacity, :price, :depth_required, :description, presence: true
  validates :depth_required, inclusion: { in: (0..40) }
  validate :user_can_be_a_teacher

  def user_can_be_a_teacher
    errors.add(:user, "can't be a teacher") unless user.level >= 4
  end
end
