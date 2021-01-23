class ProductOptionValue < ApplicationRecord
  belongs_to :product_option
  has_many :skus
end
