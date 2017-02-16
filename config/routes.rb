Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :comments
      resources :stocks
      resources :users
      post 'signup', to: 'users#create', as: 'signup'
      post 'login', to: 'users#login', as: 'login'
      get 'fetchstocks', to: 'stock_data#index', as: 'fetchstocks'
      get 'searchstocks/:id', to: 'stock_data#check_for_stock', as: 'searchstocks'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
