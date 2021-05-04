class Item < ApplicationRecord
  include Rails.application.routes.url_helpers
  
  has_many :order_items
  has_many :orders, through: :order_items
  has_many :cart_items
  has_many :carts, through: :cart_items
  belongs_to :category
  has_one_attached :image
  has_many :provisional_cart_items
  
  def save_image      
    # Download the image file in temp dir
    image_path = "#{Dir.tmpdir}/#{self.title}"
    File.open(image_path, 'wb') do |file|
      file.write(image.download)
    end   
  end
end