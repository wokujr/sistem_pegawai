Rails.application.routes.draw do
  resources :karyawans, only: [:index, :show, :create, :new, :edit, :update, :destroy]

  get 'signup', to: 'users#new'
  resources :users, except: [:new]

  #LOGIN
  get 'login', to: "sessions#new"
  post 'login', to: "sessions#create"
  delete 'logout', to: "sessions#destroy"

  get "/employee/new", to: "employee#new"
  post "/employee/create", to: "employee#create"

  root to: "main#index"

end
