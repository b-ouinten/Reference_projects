class Formation < ApplicationRecord

   # ASSOCIATIONS
   has_many :formation_attendances, dependent: :delete_all
   has_many :users, through: :formation_attendances
   has_many :formation_sessions, dependent: :delete_all
   has_many :rooms, through: :formation_sessions
   has_many :formation_categories
   has_many :categories, through: :formation_categories
   belongs_to :teacher, :class_name => 'User', :foreign_key => 'teacher_id'

   # VALIDATIONS
   validates :title, :description, presence: true
end
