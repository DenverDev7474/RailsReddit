Rails.application.routes.draw do
  get 'comments/index'
  get 'comments/show'
  get 'comments/create'
  get 'comments/update'
  get 'comments/destroy'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :properties, only: [:index, :show]
  resources :properties do
    resources :comments, only: [:create, :update, :destroy]
  end  
end
