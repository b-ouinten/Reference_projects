class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :proposal, optional: true
  belongs_to :comment, optional: true
  has_many :comments
  has_many :likes
  
  # Validations
  validates :content, presence: true, length: {minimum: 0, maximum: 2000}

  # Instance methods
  def likes_count
    self.likes.count
  end

  def comments_count
    self.comments.count
  end

  def not_liked_by?(user)
    self.likes.find_by(user: user).nil?
  end

  def isnt_comment_comment?
    self.comment_id.nil?
  end
end