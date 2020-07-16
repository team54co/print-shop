class Order < ApplicationRecord
  belongs_to :client
  has_many :ordered_products
  has_many :products, through: :ordered_products, source: :product
end
