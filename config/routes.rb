Rails.application.routes.draw do

  resources :karyawans do
    resources :salaries
    resources :positions
  end

  get "/positions", to:"positions#index"

  root to: "main#index"

end
