require 'rails_helper'

RSpec.describe Product, type: :model do
  context 'validation test' do
    it 'ensures name presence' do
      user = Product.new(name: '', price: '123', description: 'A test product').save
      expect(user).to eq(false)
    end
  end
end
