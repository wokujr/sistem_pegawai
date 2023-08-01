Rails.application.routes.draw do

  resources :karyawans do
    resources :salaries
  end

  root to: "main#index"

end
