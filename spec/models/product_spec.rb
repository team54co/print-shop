require 'rails_helper'

RSpec.describe Product, type: :model do
  context 'validation test' do
    it 'ensures name presence' do
      product = Product.new(name: '', price: '123', description: 'A test product').save
      expect(product).to eq(false)
    end

    it 'ensures price is numerical' do
      product = Product.new(name: 'Test Product', price: 'a girl', description: 'A test product').save
      expect(product).to eq(false)
    end
  end
end
