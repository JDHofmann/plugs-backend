class ProductOrder < ApplicationRecord
  belongs_to :sku
  belongs_to :order
end
