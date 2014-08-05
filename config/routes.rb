Rails.application.routes.draw do
  use_doorkeeper

  get 'welcome/show'

  devise_for :users

  root 'welcome#show'

end
