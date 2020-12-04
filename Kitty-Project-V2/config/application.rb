require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module KittenProject
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    I18n.enforce_available_locales = false

    I18n.config.available_locales = :fr
    config.i18n.default_locale = :fr
    config.time_zone = 'Europe/Paris'
    config.active_record.default_timezone = :local
    config.load_defaults 5.2
    config.action_mailer.delivery_method = :mailjet
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
