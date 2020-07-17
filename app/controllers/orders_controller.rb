class OrdersController < ApplicationController
    def new
        id = params[:client_id]
        @order = Order.create(client_id: id)
        redirect_to action: "show", id: @order.id
    end


    def show
       @client = Client.find(params[:client_id])
    end

    def index
    end

    def destroy
        @order = Order.find(params[:id])
        @order.destroy
        #redirect_to root_path
    end
end
