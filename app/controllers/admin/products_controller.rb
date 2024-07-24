module Admin
  class ProductsController < ApplicationController
    before_action :authenticate_user!
    before_action :authorize_admin
    before_action :set_store

    def index
      @products = @store.products
    end

    def new
      @product = @store.products.new
    end

    def create
      @product = @store.products.new(product_params)
      if @product.save
        redirect_to admin_store_products_path, notice: 'Product created successfully.'
      else
        render :new
      end
    end

    def edit
      @product = @store.products.find(params[:id])
    end

    def update
      @product = @store.products.find(params[:id])
      if @product.update(product_params)
        redirect_to admin_store_products_path, notice: 'Product updated successfully.'
      else
        render :edit
      end
    end

    def destroy
      @product = @store.products.find(params[:id])
      @product.destroy
      redirect_to admin_store_products_path, notice: 'Product deleted successfully.'
    end

    private

    def product_params
      params.require(:product).permit(:name, :description, :price)
    end

    def authorize_admin
      redirect_to root_path, alert: 'You are not authorized to perform this action.' unless current_user.admin?
    end

    def set_store
      @store = current_user.store
    end
  end
end
