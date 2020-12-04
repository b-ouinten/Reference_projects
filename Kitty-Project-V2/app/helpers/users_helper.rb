module UsersHelper
  def current_user_cart
    current_user.cart
  end

  def current_user_cart_total
    current_user_cart.total
  end

  def empty_current_user_cart
    current_user_cart.cart_items.destroy_all
  end

  def current_user_cart_items_count
    current_user_cart.items_count
  end
end