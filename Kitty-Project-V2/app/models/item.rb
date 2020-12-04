class Item < ApplicationRecord
  include Rails.application.routes.url_helpers
  
  has_many_attached :images
  has_many :order_items
  has_many :orders, through: :order_items
  has_many :cart_items
  has_many :carts, through: :cart_items
  belongs_to :category
  has_one_attached :image


end