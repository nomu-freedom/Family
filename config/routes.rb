Rails.application.routes.draw do
  mount ActionCable.server => "/cable"
  resources :rooms, only: [:index, :new, :show, :create, :update] do
    resources :messages, only: [:create]
  end
  root to: "rooms#index"
  

  devise_for :users, controllers: {
    registrations: "users/registrations",
    sessions: "users/sessions"
  }
  resources :users, only: [:show]

  
  get "/show_additionally", to: "rooms#show_additionally"

  devise_scope :user do
    get "sign_in", to: "users/sessions#new"
    get "sign_out", to: "users/sessions#destroy"
  end
end
