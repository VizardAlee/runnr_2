class ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_store, only: [:new, :create]

  def new
    @product = @store.products.new
  end

  def create
    @product = @store.products.new(product_params)
    @product.user = current_user

    if @product.save
      redirect_to @store, notice: 'Product was successfully created.'
    else
      render :new
    end
  end

  def show
  end

  private

  def set_store
    @store = Store.find(params[:store_id])
  end

  def product_params
    params.require(:product).permit(:name, :description, :price, :image_url)
  end
end
