class User < ApplicationRecord
  # --- Security ---
  has_secure_password

  # --- Associations ---
  belongs_to :city
  has_many :gossips
  has_many :comments
  has_many :likes

  # --- Validations ---
  validates :first_name,
    presence: true
  
  validates :last_name,
    presence: true
  
  validates :age,
    numericality: { greater_than: 0 }
  
  validates :email,
    presence: true,
    uniqueness: true,
    format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "wrong format!" }
  
  validates :password,
    presence: true,
    length: { minimum: 6 }
end
