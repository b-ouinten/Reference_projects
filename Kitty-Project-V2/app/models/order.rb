class Order < ApplicationRecord
  has_many_attached :images
  after_create :welcome_payment
  after_create :admin_receipt
  belongs_to :user, optional: true
  has_many :order_items 
  has_many :items, through: :order_items

  def welcome_payment
    OrderMailer.welcome_order(self).deliver_now
  end

  def admin_receipt
    OrderMailer.info_admin(self).deliver_now
  end

end
