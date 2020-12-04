class City < ApplicationRecord
  has_many :users
  has_many :proposals

  # Validations
  validates :zip_code, format: { with: /\A(([0-8][0-9])|(9[0-5])|(2[ab]))[0-9]{3}\z/, message: "Merci de rentrer un code postal français valide." }, presence: true
  validates :name, presence: true


  # Instance methods
  def proposals_count
    self.proposals.count
  end
end
