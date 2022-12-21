Rails.application.routes.draw do
  resources :comments
  resources :employee_tags
  get 'dashboard/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "dashboard#index"
  resources :employees do
    resources :comments, only: [:create]
  end
  get '/locale/:locale' => "dashboard#switch_locale", as: 'switch_locale'
  resources :offices do
    resources :comments, only: [:create]
  end
   
end
