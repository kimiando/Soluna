Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users
  resources :chatrooms do
    resources :messages, only: %i[create new destroy]
  end
  get '/games', to: 'games#index'
end
