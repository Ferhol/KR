class Rate < ApplicationRecord
  has_one :order, inverse_of: :rate

  validates :name_r, presence: true, uniqueness: true
  validates :times_of_day, presence: true
  validates :range, presence: true
  validates :price, presence: true, numericality:
    {only_float: true}
end
