module UsersHelper
  def current_user_cart
    current_user.cart
  end

  def current_user_cart_total
    current_user_cart.total
  end

  def current_user_cart_items_count
    current_user_cart.items_count
  end

  def empty_current_user_cart
    current_user_cart.cart_items.destroy_all
  end

  def disconnected_user_unique_id
    cookies[:disconnected_user_unique_id]
  end

  def disconnected_user_cart_items
    ProvisionalCartItem.where(unique_id: disconnected_user_unique_id)
  end

  def disconnected_user_cart_items_count
    disconnected_user_cart_items.sum(0) { |rec|
      rec.quantity
    }
  end

  def disconnected_user_cart_total
    disconnected_user_cart_items.sum(0.0) {|rec| 
      rec.quantity * rec.item.price
    }
  end

  def add_provisional_cart_to_current_user_cart
    disconnected_user_cart_items.sort_by(&:created_at).each { |rec|
      params = {cart: current_user_cart, item: rec.item}

      if CartItem.exists?(params)
        CartItem.find_by(params).increment!(:quantity, rec.quantity)
      else
        CartItem.create(params.merge(quantity: rec.quantity))
      end
    }
    
    disconnected_user_cart_items.destroy_all
  end
end