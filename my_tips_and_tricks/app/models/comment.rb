class Comment < ApplicationRecord
  # --- Associations ---
  belongs_to :gossip
  belongs_to :user
end
