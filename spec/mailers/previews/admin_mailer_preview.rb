class AdminMailerPreview < ActionMailer::Preview

  def new_user_waiting_for_approval
    AdminMailer.new_user_waiting_for_approval(User.first)
  end

end
