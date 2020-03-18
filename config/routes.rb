Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  root to: 'resources#index'
  resources :resources, except: :show
  patch "resources/approve/:id", to: "resources#approve", as: :approve

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
