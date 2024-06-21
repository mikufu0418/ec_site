class CartsController < ApplicationController
 before_action :current_cart

def show
  @line_items = @current_cart.line_items
end

def destroy
  session[:cart_id] = nil
  redirect_to products_path
end

end
