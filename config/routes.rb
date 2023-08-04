Rails.application.routes.draw do

  resources :karyawans do
    resources :salaries
    resources :positions, only: [:new, :create, :show]
  end

  get "/position/:id", to: "positions#show"

  get "/positions", to:"positions#index"

  get "/employee/new", to: "employee#new"
  post "/employee/create", to: "employee#create"

  root to: "main#index"

end
