class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :password, :order_reciepts

  def order_reciepts 
    self.object.orders.map do |o|
      order_items = o.product_orders.map do | po |
        {
          product_order_id: po.id,
          item_unit_price: po.sku.price,
          item_quantity: po.quantity,
          item_price_total: po.sku.price * po.quantity,
          item_name: po.sku.name
        }
      end
      order_total = order_items.map do | oi | oi[:item_price_total]
      end

      {
        order_id: o.id,
        order_date: o.created_at.to_date,
        order_items: order_items,
        order_total: order_total.sum
      }
    end 
  end 
end
