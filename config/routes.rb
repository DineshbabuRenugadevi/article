Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

    root "articles#home"
    resources :books #, only: [:show, :index, :new, :create, :edit, :update, :destroy ]
    get "listindex", to: "books#listindex"
    get "signup", to: "users#new"
    resources :users, except: [:new]
    get "listuser", to: "users#listuser"

    get 'login', to: 'sessions#new'
    post 'login', to: 'sessions#create'
    delete 'logout', to: 'sessions#destroy'
    
end
