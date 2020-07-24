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
        post_via_redirect products_path, :task => { :name => "mow lawn" }
        response.body.should include("mow lawn")
    end
  end
  
end
