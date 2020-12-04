require "administrate/base_dashboard"

class ProposalDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    city: Field::BelongsTo,
    category: Field::BelongsTo,
    user: Field::BelongsTo,
    comments: Field::HasMany,
    votes: Field::HasMany,
    picture_attachment: Field::ActiveStorage,
    picture_blob: Field::ActiveStorage,
    id: Field::Number,
    title: Field::String,
    purpose: Field::Text,
    description: Field::Text,
    is_online: Field::Boolean,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
  city
  category
  user
  comments
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
  city
  category
  user
  comments
  votes
  picture_attachment
  picture_blob
  id
  title
  purpose
  description
  is_online
  created_at
  updated_at
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
  city
  category
  user
  comments
  votes
  picture_attachment
  picture_blob
  title
  purpose
  description
  is_online
  ].freeze

  # COLLECTION_FILTERS
  # a hash that defines filters that can be used while searching via the search
  # field of the dashboard.
  #
  # For example to add an option to search for open resources by typing "open:"
  # in the search field:
  #
  #   COLLECTION_FILTERS = {
  #     open: ->(resources) { resources.where(open: true) }
  #   }.freeze
  COLLECTION_FILTERS = {}.freeze

  # Overwrite this method to customize how proposals are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(proposal)
  #   "Proposal ##{proposal.id}"
  # end
end
