class AdminMailer < ApplicationMailer
  default to: Proc.new { User.where(admin: true).pluck(:email) }

  def new_user_waiting_for_approval(user)
    @user = user
    mail( subject: "New User waiting for approval: #{@user.full_name}" )
  end
end
