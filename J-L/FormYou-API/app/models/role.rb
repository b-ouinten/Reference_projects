class Role < ApplicationRecord
    # ASSOCIATIONS
    has_many :users
    # VALIDATIONS
    validates :name, presence: true

end
