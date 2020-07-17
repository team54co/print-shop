class OrdersController < ApplicationController
    def new
        id = params[:client_id]
        @order = Order.create(client_id: id)
        redirect_to action: "show", id: @order.id
    end


    def show
      @client = Client.find(params[:client_id]) if params[:client_id] 
      @order = Order.find(params[:id])
    end

    def index
      @client = Client.find(params[:client_id])
      @orders = @client.orders
    end

    def destroy
        @client = Client.find(params[:client_id])
        @order = Order.find(params[:id])
        @order.destroy
    
        respond_to do |format|
          format.html { redirect_to client_orders_path(@client) }
          format.xml  { head :ok }
        end
    end

  end