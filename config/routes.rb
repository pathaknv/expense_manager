Rails.application.routes.draw do

  resources :users do
    resources :transactions
  end

  root 'transactions#filters'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
