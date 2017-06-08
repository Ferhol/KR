class Driver1 < ApplicationRecord
  has_many :cars, dependent: :destroy, inverse_of: :driver1
  accepts_nested_attributes_for :cars, allow_destroy: true

  has_many :orders

  validates :fn, presence: true
  validates :sn, presence: true
  validates :birthday, presence: true
  validates :inn, presence: true, uniqueness: true, numericality:
    {only_integer: true}
  validates :series_p, presence: true, numericality:
    {only_integer: true}
  validates :number_p, presence: true, uniqueness: true, numericality:
    {only_integer: true}

end
