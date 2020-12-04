class CartsController < ApplicationController
  def index
    @cart = Cart.all
    @category = Category.all
  end
  
  def show
    @cart = current_user_cart
    @item_list = @cart.cart_items
    
    @total = current_user_cart_total
  end
end