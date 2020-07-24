class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    product = Product.new(product_params)
    if product.save
      redirect_to product, notice: 'Product successfully created'
    else
      redirect_to(action: 'new')
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
    end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      flash[:notice] = 'Product successfully updated'
      redirect_to @product
    else
      render 'edit'
    end
  end

  def destroy
    @product = Product.find(params[:id])

    if @product.orders.count == 0 && @product.destroy
      redirect_to products_path, notice: 'Product successfully deleted'

    else
      flash[:notice] = 'Product cannot be deleted because product has
           existing orders'
      redirect_to product_path(@product)
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :description)
  end
end
