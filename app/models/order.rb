class Order < ApplicationRecord
  belongs_to :user
  has_many :product_orders

  def price_total 
    total = []
    self.product_orders.each do | po |
      if po.quatity > 0
        result = po.sku.price * po.quantity
        total << result
      end
    end 
    total.sum()
  end 

end
