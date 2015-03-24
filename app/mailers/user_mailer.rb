class UserMailer < ApplicationMailer

  def account_approved(user)
    @user = user
    mail( to: @user.email, subject: "Your account has been approved!" )
  end
end
