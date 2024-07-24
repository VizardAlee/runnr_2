module Admin
  class StoresController < ApplicationController
    before_action :authenticate_user!
    before_action :authorize_admin

    def show
      @store = current_user.store
    end

    def new
      @store = Store.new
    end

    def create
      @store = current_user.build_store(store_params)
      if @store.save
        redirect_to admin_store_path, notice: 'Store created successfully.'
      else
        render :new
      end
    end

    def edit
      @store = current_user.store
    end

    def update
      @store = current_user.store
      if @store.update(store_params)
        redirect_to admin_store_path, notice: 'Store updated successfully.'
      else
        render :edit
      end
    end

    def destroy
      @store = current_user.store
      @store.destroy
      redirect_to root_path, notice: 'Store deleted successfully.'
    end

    private

    def store_params
      params.require(:store).permit(:name, :description)
    end

    def authorize_admin
      redirect_to root_path, alert: 'You are not authorized to perform this action.' unless current_user.admin?
    end
  end
end
