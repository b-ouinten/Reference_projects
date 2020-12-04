class ItemsController < ApplicationController
  def index
    @categories = Category.all
    
    @category_id = params[:category_id]
    unless (@category_id.nil?) || (@category_id === '') 
      category = Category.find(@category_id)
      @items = category.items
    else
      @items = Item.all
    end
  end
  
  def show
    @item = Item.find(params[:id])
  end
end
