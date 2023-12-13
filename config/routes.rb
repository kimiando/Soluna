Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :chatrooms, only: [:index, :show, :new, :create] do
    resources :messages, only: [:create, :new]
  end
  # Defines the root path route ("/")
  # root "chatrooms#show"
end
