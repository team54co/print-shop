class OrderedProductsController < ApplicationController
    def new
        @order = Order.find(params[:order_id])
        @ordered_product = OrderedProduct.new
        @product = Product.new
        @products = Product.all
    end

    def create
    #     order = Order.find(params[:order_id])
    #     product_params = params[:ordered_product]
    #     puts product_params
    #     product = Product.new(
    #         name: product_params['name'],
    #         price:  product_params['price'],
    #         description: product_params['description']
    #     )
    #     if product.save
    #         product_params['specific']['product_id'] = product.id
    #         product_params['specific']['order_id'] = params[:order_id]
    #         OrderedProduct.create(
    #             product_id: product.id,
    #             order_id: params[:order_id],
    #             quantity: product_params['specific']['quantity'],
    #             alterations: product_params['specific']['quantity'],
    #             status: 'Processing'
    #         )
    #         redirect_to order
    #     else
    #         render new
    #     end
     end
end
