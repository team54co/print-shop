class Product < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: true
  has_many :ordered_products
  has_many :orders, through: :ordered_products, source: :order
end
