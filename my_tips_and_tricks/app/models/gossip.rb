class Gossip < ApplicationRecord
  # --- Associations ----
  belongs_to :user
  has_many :gossips_tags
  has_many :tags, through: :gossips_tags
  has_many :comments
  has_many :likes

  # --- Validatins ---
  validates :title,
    presence: true,
    length: { in: 3..14, 
      too_short: " must have at least %{count} characters",
      too_long: " must have at most %{count} characters"
    }

  validates :content,
    presence: true

  # --- Instance methods ---
  def comments_count
    self.comments.count
  end

  def like_of(user)
    Like.find_by(user_id: user.id, gossip_id: self.id) if user
  end
end
