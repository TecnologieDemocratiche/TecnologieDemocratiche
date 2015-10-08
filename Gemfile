source 'https://rubygems.org'

ruby File.read('.ruby-version').strip

gem 'rails', '~> 4.2.0'
gem 'pg'
gem 'sass-rails'
gem 'uglifier'
gem 'coffee-rails'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jquery-turbolinks'
gem 'jbuilder'
gem 'responders'
gem 'devise'
gem 'figaro'
gem 'doorkeeper'
gem 'foundation-rails', '5.5.1.0'
gem 'font-awesome-rails'
gem 'nprogress-rails'
gem 'slim-rails'
gem 'cancancan'
gem 'simple_form'
gem 'paperclip'
gem 'aws-sdk', '< 2.0'
gem 'sdoc', group: :doc
gem 'premailer'
gem 'nokogiri'
gem 'premailer-rails'
gem 'faker'
gem 'codice-fiscale', git: 'https://github.com/topac/codice_fiscale.git'
gem 'acts_as_list'
gem 'rails_admin'

group :development do
  gem 'did_you_mean'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'quiet_assets'
  gem 'bullet'
  gem 'spring'
  gem 'rubocop'
  gem 'letter_opener'
  gem 'pry-rails'
end

group :test do
  gem 'factory_girl_rails'
  gem 'rspec-rails'
  gem 'capybara'
  gem 'database_cleaner'
  gem 'capybara-webkit'
  gem 'capybara-screenshot'
  gem 'simplecov', require: false
end

group :production do
  gem 'rails_12factor'
  gem 'sentry-raven'
  gem 'newrelic_rpm'
  # wake up my dyno by pinging the webiste each half hour
  gem 'dynopoker'
end
