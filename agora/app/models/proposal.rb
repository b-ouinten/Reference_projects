class Proposal < ApplicationRecord
  # Mailer config
  after_create :admin_receipt
  after_create :user_receipt
  after_update :validate_proposal
  #after_create :mail_vote
  
  # Relations
  belongs_to :city
  belongs_to :category
  belongs_to :user
  has_many :comments
  has_many :votes

  # Active storage
  has_one_attached :picture

  # Validations
  validates :title, presence: true, length: { minimum: 3, maximum: 65 }
  validates :purpose, presence: true, length: { minimum: 10, maximum: 500 }
  validates :description, presence: true, length: { minimum: 30, maximum: 2000 }
  # validate :must_has_attachment

  # Instance methods
  
  def comments_count
    self.comments.count
  end
  
  def votes_count
    self.votes.count
  end
  
  def vote_of(user)
    self.votes.find_by(user: user)
  end
  
  def general_classification
    Proposal.all.sort { |p1, p2| p2.votes_count <=> p1.votes_count }.index(self) + 1
  end
  
  def category_classification
    self.category.proposals.sort { |p1, p2| p2.votes_count <=> p1.votes_count }.index(self) + 1
  end
  
  def on_line
    self.update(is_online: true)
  end
  
  def lifetime
    30 - ((Time.now - self.created_at).to_f / 1.day).floor
  end
  
  def is_expired?
    if(Time.now > (self.created_at + (60 * 60 * 24 * 30)))
      return true
    else
      return false
    end
  end

  def user_receipt
    ProposalMailer.info_user(self).deliver_now
  end

  def admin_receipt
    ProposalMailer.info_admin(self).deliver_now
  end

  private
  
  def validate_proposal
    if is_online?
      ProposalMailer.confirmation_proposal(self).deliver
    end
  end

  def must_has_attachment
    errors.add(:base, "Il faut associer une image à ta proposition !") unless self.picture.attached?
  end
end