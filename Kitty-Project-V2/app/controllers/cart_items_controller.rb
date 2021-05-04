class CartItemsController < ApplicationController
  def index
    @cart = current_user_cart
    @cart_items = @cart.cart_items.sort_by(&:created_at)
    
    @total_quantities = current_user_cart_items_count
    @total = current_user_cart_total
  end
  
  def create
    @item = Item.find(permitted_item_id_param)
    params = {item: @item, cart: current_user_cart}

    if CartItem.exists?(params)
      CartItem.find_by(params).increment!(:quantity)
    else
      @cart_item = CartItem.create(params)

      if @cart_item.valid?
        # flash[:notice] = 'Un produit a été ajouté à votre panier !'
      else
        # flash[:alert] = purify_message(@cart_item.errors.full_messages.to_sentence)
      end
    end
    
    respond_to do |format|
      format.html { redirect_back fallback_location: root_path }
      format.js { }
    end
  end

  def update
    cart_item = CartItem.find(permitted_cart_item_id_param)
    cart_item.update(quantity: permitted_item_quantity_param)

    @total_quantities = current_user_cart_items_count
    @total = current_user_cart_total
  end
  
  def destroy
    @cart_item_id = params[:id]
    CartItem.destroy(@cart_item_id)
    
    respond_to do |format|
      format.html { redirect_to cart_items_path }
      format.js { }
    end
  end

  private

  def permitted_item_id_param
    params.permit(:item_id).require(:item_id)
  end

  def permitted_cart_item_id_param
    params.permit(:id).require(:id)
  end  
  
  def permitted_item_quantity_param
    params.permit(:quantity).require(:quantity)
  end
end