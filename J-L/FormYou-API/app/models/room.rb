class Room < ApplicationRecord

    # ASSOCIATIONS
    has_many :formation_sessions
    has_many :formation_attendances, through: :formation_sessions
    has_many :formations, through: :formation_sessions
    has_many :users, through: :formation_sessions

    # VALIDATIONS
    validates :name, presence: true

end
