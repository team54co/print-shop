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
        @client = Post.find(params[:client_id])
        @order = Order.find(params[:id])
        @order.destroy
    
        respond_to do |format|
          format.html { redirect_to client_order_path(@client) }
          format.xml  { head :ok }
        end
    end

  end