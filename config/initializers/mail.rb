ActionMailer::Base.default_options = {
    from: ENV['MAIL_SENDER'],
    reply_to: ENV['MAIL_SENDER'],
}
ActionMailer::Base.default_url_options = {host: ENV['APP_HOST'], port: ENV['APP_PORT']}

if Rails.env.production?
  ActionMailer::Base.smtp_settings = {
      address: 'smtp.mandrillapp.com',
      port: 587,
      enable_starttls_auto: true,
      user_name: ENV['MAIL_USERNAME'],
      password: ENV['MAIL_PASSWORD'],
      authentication: 'login',
      domain: ENV['APP_HOST'],
  }
end
