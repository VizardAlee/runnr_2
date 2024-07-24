class HomeController < ApplicationController
  def index
    if user_signed_in?
      if current_user.store
        redirect_to current_user.store
      else
        @show_create_store_button = true
      end
    end
    @products = Product.all
  end
end
