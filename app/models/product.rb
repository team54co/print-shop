class Product < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  has_many :ordered_products
  has_many :deliveries, through: :ordered_products, source: :products
end
