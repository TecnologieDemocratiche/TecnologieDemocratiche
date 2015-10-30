if Rails.env.production?
  dns_url = "https://#{ENV['SENTRY_PUBLIC_KEY']}:#{ENV['SENTRY_PRIVATE_KEY']}@app.getsentry.com/#{ENV['SENTRY_PORT']}"
  require 'raven'
  Raven.configure do |config|
    config.dsn = dns_url
  end
end
