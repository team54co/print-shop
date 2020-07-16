
class Client < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :sec_no, presence: true
  validates :country, presence: true
  validates :address, presence: true
  validates :phone, presence: true
end
