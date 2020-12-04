class Vote < ApplicationRecord
  after_create :mail_vote
  belongs_to :user
  belongs_to :proposal
  validates :proposal_id, uniqueness: {scope: :user_id}

  def mail_vote
    ProposalMailer.send_email_after_votes(self.proposal).deliver_now
  end
end
