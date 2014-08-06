Rails.application.routes.draw do
  get 'users/show'

  get 'users/index'

  get 'users/edit'

  get 'users/update'

  get 'users/create'

  get 'users/destroy'

  use_doorkeeper

  get 'welcome/show'

  devise_for :users

  resources :users

  root 'welcome#show'

  namespace :api do
    namespace :v1 do
      get '/me' => "credentials#me"
    end
  end

end
