class OrdersController < ApplicationController
  def new
    id = params[:client_id]
    @order = Order.create(client_id: id)
    redirect_to action: 'show', id: @order.id
  end

  def show
    @order = Order.find(params[:id])
    @client = @order.client
  end

  def index
    if params[:client_id]
      @client = Client.find(params[:client_id])
      @orders = @client.orders
    elsif params[:product_id]
      @product = Product.find(params[:product_id])
      @orders = @product.orders
    else
      @orders = Orders.all
    end
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
