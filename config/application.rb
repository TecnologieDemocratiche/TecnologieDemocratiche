require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
require 'active_model/railtie'
require 'active_record/railtie'
require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'action_view/railtie'
require 'sprockets/railtie'
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TecnologieDemocratiche
  class Application < Rails::Application
    config.i18n.available_locales = [:en, :it]
    config.i18n.default_locale = :it
    config.i18n.fallbacks = true
    config.to_prepare do
      Doorkeeper::ApplicationsController.layout 'application'

      Doorkeeper::AuthorizationsController.layout 'application'

      Doorkeeper::AuthorizedApplicationsController.layout 'application'
    end

    config.action_mailer.default_url_options = {host: ENV['TD_HOST']}
  end
end

if Rails.env.production?
  Dynopoker.configure do |config|
    config.address = 'https://tecnologiedemocratiche.herokuapp.com'
  end
end
