class StoresController < ApplicationController
  before_action :authenticate_user!, only: [:create, :new, :edit, :update, :destroy]
  before_action :set_store, only: [:show, :edit, :update, :destroy]

  def show
    # @store = Store.find(params[:id])
    @products = @store.products
  end

  def new
    @store = Store.new
  end

  def create
    @store = current_user.build_store(store_params)

    if @store.save
      current_user.update(role: :admin)
      redirect_to @store, notice: 'Store was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @store.update(store_params)
      redirect_to @store, notice: 'Store was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @store.destroy
    redirect_to root_path, notice: 'Store was successfully deleted.'
  end


  private

  def set_store
    @store = Store.find(params[:id])
  end

  def store_params
    params.require(:store).permit(:name, :description, :image_url)
  end
end
