class ProductOrderSerializer < ActiveModel::Serializer
  attributes :id 
  # has_many :skus 
  belongs_to :order
end
