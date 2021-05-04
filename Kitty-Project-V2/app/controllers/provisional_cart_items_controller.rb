class ProvisionalCartItemsController < ApplicationController
  def index
    @provisional_cart_items = disconnected_user_cart_items.sort_by(&:created_at)
    @total_quantities = disconnected_user_cart_items_count
    @total = disconnected_user_cart_total
  end
  
  def create
    if disconnected_user_unique_id.nil?
      unique_id = Time.now.to_i.to_s.concat('.', Time.now.nsec.to_s, '.', SecureRandom.urlsafe_base64) 
      cookies.permanent[:disconnected_user_unique_id] = unique_id
    end

    @item = Item.find(permitted_item_id_param)
    params = {item: @item, unique_id: disconnected_user_unique_id}
    
    if ProvisionalCartItem.exists?(params)
      ProvisionalCartItem.find_by(params).increment!(:quantity)
    else
      @provisional_cart_item = ProvisionalCartItem.create(params)
      if @provisional_cart_item.valid?
        # flash[:notice] = 'Un produit a été ajouté à votre panier !'
      else
        # flash[:alert] = purify_message(@provisional_cart_item.errors.full_messages.to_sentence)
      end
    end
    
    respond_to do |format|
      format.html { redirect_back fallback_location: root_path }
      format.js { }
    end
  end

  def update
    provisional_cart_item = ProvisionalCartItem.find(permitted_provisional_cart_item_id_param)
    provisional_cart_item.update(quantity: permitted_item_quantity_param)
    
    @total_quantities = disconnected_user_cart_items_count
    @total = disconnected_user_cart_total
  end
  
  def destroy
    @provisional_cart_item_id = params[:id]
    ProvisionalCartItem.destroy(@provisional_cart_item_id)

    respond_to do |format|
      format.html { redirect_to provisional_cart_items_path }
      format.js { }
    end
  end
  
  private
  
  def permitted_item_id_param
    params.permit(:item_id).require(:item_id)
  end

  def permitted_provisional_cart_item_id_param
    params.permit(:id).require(:id)
  end
  
  def permitted_item_quantity_param
    params.permit(:quantity).require(:quantity)
  end
end