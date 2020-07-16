class Order < ApplicationRecord
  belongs_to :client
  validates :price, presence: true
  validates :delivery_at, presence: true
end
