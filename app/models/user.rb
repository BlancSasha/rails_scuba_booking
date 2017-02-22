class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :bookings, dependent: :destroy
  has_many :dives, dependent: :destroy
  validates :name, presence: true
  validates :level, inclusion: { in: (1..5) }
  validate :user_can_be_a_teacher
  validates :bio, uniqueness: true, if: :teacher
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_attachment :photo

  protected

  def user_can_be_a_teacher
    if level < 4
      errors.add(:teacher, "can't be a teacher") unless teacher == false
    else
      true
    end
  end
end
