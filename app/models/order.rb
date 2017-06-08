class Order < ApplicationRecord
  belongs_to :driver1
  belongs_to :rate, dependent: :destroy, inverse_of: :order
  accepts_nested_attributes_for :rate, allow_destroy: true

  validates :date_o, presence: true
  validates :time_o, presence: true
  validates :address_o, presence: true
  validates :address_p, presence: true
  validates :number_p, presence: true, numericality:
    {only_integer: true}
  validates :route_length, presence: true, numericality:
    {only_float: true}

  def self.search(params)
    result = Order.includes(:rate, :driver1).references(:rate, :driver1)
    if params['date_o'].present?
      result = result.where(date_o: params['date_o'])
    end
    if params['address_o'].present?
      result = result.where(address_o: params['address_o'])
    end
    if params['address_p'].present?
      result = result.where(address_p: params['address_p'])
    end
    if params['number_p'].present?
      result = result.where(number_p: params['number_p'])
    end
    if params['route_length'].present?
      result = result.where(route_length: params['route_length'])
    end
    if params['fn'].present?
      result = result.where(driver1s: {fn: params['fn']})
    end
    if params['name_r'].present?
      result = result.where(rates: {name_r: params['name_r']})
    end
    result.all
  end
end
