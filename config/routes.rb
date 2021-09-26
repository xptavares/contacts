Rails.application.routes.draw do
  resources :import_errors
  resources :lead_errors
  resources :leads
  resources :imports
  devise_for :users
  get "/columns", to: "column#index"
  mount Sidekiq::Web => "/sidekiq"
  root to: "root#index"
end
