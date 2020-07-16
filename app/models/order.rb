class Order < ApplicationRecord
  belongs_to :client
  validates :price, presence: true
  validates :delivery_at, presence: true
  has_many :ordered_products
  has_many :products, through: :ordered_products, source: :product
end
