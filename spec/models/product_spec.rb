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

  context 'properly creates product' do
    let!(:products) { create_list(:product, 1) }
    let(:product) { products.first }

    it 'creates a product successfully' do
      expect(product.id.nil?).to eq(false)
    end
  end
end
