class OrderedProductsController < ApplicationController
    def new
        @order = Order.find(params[:order_id])
        @ordered_product = OrderedProduct.new
        @product = Product.new
        @products = Product.all
    end

    def create
        order = Order.find(params[:order_id])
        product_params = params[:ordered_product]
        puts product_params
        if product_params['product_id'] == '0'
        product = Product.new(
            name: product_params['name'],
            price:  product_params['price'],
            description: product_params['description']
        )
        end
        if product&.save or product_params['product_id'] != 0
            if product
                id = product.id
            else
                id = product_params['product_id']
            end
            OrderedProduct.create(
                product_id: id,
                order_id: params[:order_id],
                quantity: product_params['specific']['quantity'],
                alterations: product_params['specific']['alterations'],
                status: 'Processing'
            )
            redirect_to order
        else
            render new
        end
    end
end
