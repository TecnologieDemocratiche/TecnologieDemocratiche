# Use this hook to configure devise mailer, warden hooks and so forth.
# Many of these configuration options can be set straight in your model.
Devise::Mailer.layout 'email_responsive'

Devise.setup do |config|
  config.secret_key = ENV['DEVISE_SECRET_KEY']
  config.mailer_sender = 'info@tecnologiedemocratiche.it'

  require 'devise/orm/active_record'

  config.case_insensitive_keys = [:email]
  config.strip_whitespace_keys = [:email]
  config.skip_session_storage = [:http_auth]

  config.stretches = Rails.env.test? ? 1 : 10
  config.pepper = ENV['DEVISE_PEPPER_KEY']

  config.reconfirmable = true
  config.password_length = 8..128
  config.reset_password_within = 6.hours

  config.sign_out_via = :delete
end
