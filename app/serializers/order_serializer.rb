class OrderSerializer < ActiveModel::Serializer
  attributes :id
  belongs_to :user
  has_many :product_orders
  # has_many :skus, through: :product_orders
end
