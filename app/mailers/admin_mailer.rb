class AdminMailer < ApplicationMailer
  default to: Proc.new { User.where(admin: true).pluck(:email) }

  def new_user_waiting_for_approval(user)
    @user = user
    mail(subject: I18n.t('admin_mailer.new_user_waiting_for_approval.subject', name: @user.full_name))
  end
end
