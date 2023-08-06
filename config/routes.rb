Rails.application.routes.draw do
  resources :karyawans, only: [:index, :show, :create, :new]
  resources :positions, only: [:new, :create, :show]


  get "/position/:id", to: "positions#show"
  get "/positions", to:"positions#index"
  get "/employee/new", to: "employee#new"
  post "/employee/create", to: "employee#create"

  root to: "main#index"

end
