class UserMailerPreview < ActionMailer::Preview

  def account_approved
    UserMailer.account_approved(User.first)
  end

end
