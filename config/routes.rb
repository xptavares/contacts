Rails.application.routes.draw do
  resources :imports
  devise_for :users
  root to: "root#index"
end
