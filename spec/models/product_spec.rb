require 'rails_helper'

RSpec.describe Product, type: :model do
  context 'validation test' do
    it 'ensures name presence' do
      product = Product.new(name: '', price: '123', description: 'A test product')
      expect(product).to_not be_valid
    end

    it 'ensures price is numerical' do
      product = Product.new(name: 'Test Product', price: 'a girl', description: 'A test product')
      expect(product).to_not be_valid
      expect(product.errors[:price]).to include('is not a number')
    end

    it 'ensures price is present' do
      product = Product.new(name: 'Test Product', price: '', description: 'A test product')
      expect(product).to_not be_valid
    end


    it 'ensures description is present' do
      product = Product.new(name: 'Test Product', price: 700, description: '')
      expect(product).to_not be_valid
    end
  end
end
