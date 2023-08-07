Rails.application.routes.draw do
  resources :karyawans, only: [:index, :show, :create, :new, :edit, :update, :destroy]

  resources :positions, only: [:new, :create, :show]

  get 'signup', to: 'users#new'
  resources :users, except: [:new]

  get "/employee/new", to: "employee#new"
  post "/employee/create", to: "employee#create"

  root to: "main#index"

end
