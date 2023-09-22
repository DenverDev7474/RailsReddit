Rails.application.routes.draw do
  devise_for :users
  resources :properties, only: [:index, :show]
  resources :properties do
    resources :comments, only: [:index, :create]
  end  
end
