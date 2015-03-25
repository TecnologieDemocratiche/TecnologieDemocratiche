class ApplicationMailer < ActionMailer::Base
  default from: ENV['TD_EMAIL'], content_type: "text/html"
  layout 'email_responsive'
end
