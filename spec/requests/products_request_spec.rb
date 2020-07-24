require 'rails_helper'

RSpec.describe 'Products', type: :request do
  let!(:products) { create_list(:product, 1) }
  let(:product) { products.first }

  context 'request list of all users' do
    it 'returns http success on index' do
      get products_path
      expect(response).to have_http_status(:ok)
      expect(response.body).to include(product.name)
    end
  end

  context 'it can create a new product' do
    it 'creates a product' do
      post products_path, params: { product: {
        name: 'Fliers',
        description: 'A flier for testing',
        price: 500
      } }
      follow_redirect!
      expect(response.body).to include('Product successfully created')
      expect(response.body).to include('A flier for testing')
    end

    it 'does not redirect on unsuccessful product creation' do
      post products_path, params: { product: {
        name: '',
        description: 'A flier for testing',
        price: 500
      } }
      follow_redirect!
      expect(response.body).to include('Create a new product here')
    end
  end
end
