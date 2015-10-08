Rails.application.routes.draw do
  use_doorkeeper

  devise_for :users

  admin_required = lambda do |request|
    request.env['warden'].authenticate? && request.env['warden'].user.admin?
  end

  resources :users do
    member do
      get :download_document
      get :download_payment_recipe
    end
  end

  root 'welcome#show'

  namespace :api do
    namespace :v1 do
      get '/me' => 'credentials#me'
    end
  end

  constraints admin_required do
    mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  end
end
