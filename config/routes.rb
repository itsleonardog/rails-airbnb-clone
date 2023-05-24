Rails.application.routes.draw do
  get 'reviews/new'
  devise_for :users
  resources :accommodations do
    resources :reviews, only: [:new, :create]
    collection do
      get :top
    end
  end
  resources :reviews, only: [:destroy]

  root to: "pages#home"
  get '/about', to: 'pages#about'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
