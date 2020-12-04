class Like < ApplicationRecord
  # --- Associations ---
  belongs_to :user
  belongs_to :gossip

  # --- Validations ---
  validates :user_id,
    uniqueness: { scope: :gossip_id, message: 'already liked' }
end