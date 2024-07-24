class HomeController < ApplicationController
  def index
    if user_signed_in?
      if current_user.admin?
        if current_user.store
          redirect_to admin_store_path and return
        else
          redirect_to new_admin_store_path and return
        end
      end
    end
    @products = Product.all
  end
end
