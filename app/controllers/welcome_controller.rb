# homepage controller
class WelcomeController < ApplicationController
  def show
    redirect_to new_user_session_path unless signed_in?
  end
end
