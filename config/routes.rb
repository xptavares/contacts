Rails.application.routes.draw do
  resources :import_errors
  resources :lead_errors
  resources :leads do
    resources :lead_errors
  end
  resources :imports do
    resources :import_errors
  end
  devise_for :users
  get "/columns", to: "column#index"
  mount Sidekiq::Web => "/sidekiq"
  root to: "imports#index"
end
