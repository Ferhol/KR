class Car < ApplicationRecord
  belongs_to :driver1, inverse_of: :cars

  validates :mark, presence: true
  validates :class_c, presence: true
  validates :license_plate, presence: true, uniqueness: true, numericality:
    {only_integer: true}
  validates :color, presence: true
  validates :year_of_issue, presence: true
end
