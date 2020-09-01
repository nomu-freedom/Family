Rails.application.routes.draw do
  mount ActionCable.server => "/cable"
  root to: "rooms#index"
  devise_for :users, controllers: {
    registrations: "users/registrations",
    sessions: "users/sessions"
  }
  resources :users, only: [:show]
  resources :rooms, only: [:new, :show, :create, :update] do
    resources :messages, only: [:create]
  end
  
  get "/show_additionally", to: "rooms#show_additionally"

  #devise_scope :user do
    #get "sign_in", to: "users/sessions#new"
    #get "sign_out", to: "users/sessions#destroy"
  #end
end
