Rails.application.routes.draw do
  resources :lead_errors
  resources :leads
  resources :imports
  devise_for :users
  get "/columns", to: "column#index"
  root to: "root#index"
end
