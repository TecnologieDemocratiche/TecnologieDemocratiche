class UserMailer < ApplicationMailer

  def account_approved(user)
    @user = user
    mail(to: @user.email, subject: I18n.t('user_mailer.account_approved.subject'))
  end
end
