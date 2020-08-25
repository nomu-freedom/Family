Rails.application.routes.draw do
  mount ActionCable.server => "/cable"
  root to: "rooms#show"
  devise_for :users, controllers: {
    registrations: "users/registrations",
    sessions: "users/sessions"
  }
  resources :users, only: [:show]
  resources :messages, only: [:create]
  resources :rooms, only: [:show]

  get "/show_additionally", to: "rooms#show_additionally"

  devise_scope :user do
    get "sign_in", to: "users/sessions#new"
    get "sign_out", to: "users/sessions#destroy"
  end
end
