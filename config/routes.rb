Rails.application.routes.draw do
  devise_for :users
  root to: 'home#top'
  get "about" => "home#about", as: "about"
  resources :posts do
    resources :post_comments, only: [:create, :destroy]
  end
  resources :users,only: [:edit,:show]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
