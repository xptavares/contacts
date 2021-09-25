Rails.application.routes.draw do
  resources :imports
  devise_for :users
  get "/columns", to: "column#index"
  root to: "root#index"
end
