class ImagesController < ApplicationController

  
  def create
    @item = Item.find(params[:item_id])
    if( params[:image] != nil)
      @item.image.attach(params[:image])
    end
    redirect_to(item_path(@item))
  end

end
