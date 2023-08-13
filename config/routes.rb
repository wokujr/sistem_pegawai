Rails.application.routes.draw do

  resources :users, except: [:new] do
    member do
      post :clock_in
      post :clock_out
    end
  end

  resources :karyawans, only: [:index, :show, :create, :new, :edit, :update, :destroy]
  get 'signup', to: 'users#new'


  #clock in
  get 'clock_data', to: "users#clock_data"

  #LOGIN
  get 'login', to: "sessions#new"
  post 'login', to: "sessions#create"
  delete 'logout', to: "sessions#destroy"

  root to: "main#index"

  get 'admin', to: "admin#new"
  post 'admin', to: "admin#create"

  get 'password/reset', to: "password_resets#new"
  post 'password/reset', to: "password_resets#create"
  get 'password/reset/edit', to: "password_resets#edit"
  patch 'password/reset/edit', to: "password_resets#update"


end
