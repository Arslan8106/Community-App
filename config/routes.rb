Rails.application.routes.draw do
  get 'users/index'
  get 'static_pages/landing_page'
  get 'static_pages/dashboard'
  resources :comments

  devise_scope :user do
    # Redirests signing out users back to sign-in
    
    get "users", to: "devise/sessions#new"
    get '/users/sign_out' => 'devise/sessions#destroy'
    resources :articles do
      resources :comments
    
    end
  end
  

 
  devise_for :users
resources :users

  resources :groups do
    resources :articles
    get 'join', on: :member
end
  root "groups#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
