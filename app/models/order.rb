class Order < ApplicationRecord
  belongs_to :user
  has_many :product_orders

  def price_total 
    100
  end 
end
