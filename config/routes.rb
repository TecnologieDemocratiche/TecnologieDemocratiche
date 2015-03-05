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

  resources :users do
    member do
      get :download_document
      get :download_payment_recipe
    end
  end

  root 'welcome#show'

  namespace :api do
    namespace :v1 do
      get '/me' => "credentials#me"
    end
  end

end
