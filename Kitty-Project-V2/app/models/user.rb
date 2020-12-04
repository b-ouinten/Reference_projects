class User < ApplicationRecord
  after_create :create_my_cart
  after_create :welcome_send
  belongs_to :cart, optional: true
  has_many :orders
  has_one_attached :avatar

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end

  private

  def create_my_cart
    self.update(cart: Cart.new)
  end
end