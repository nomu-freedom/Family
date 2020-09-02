Rails.application.routes.draw do
  
  root to: "rooms#index"
  
  resources :rooms, only: [:index, :new, :show, :create, :update] do
    resources :messages, only: [:create]
  end
  resources :users, only: [:show]

  devise_for :users, controllers: {
    registrations: "users/registrations",
    sessions: "users/sessions"
  }

  mount ActionCable.server => "/cable"
  
  get "/show_additionally", to: "rooms#show_additionally"

  #devise_scope :user do
    #get "sign_in", to: "users/sessions#new"
    #get "sign_out", to: "users/sessions#destroy"
  #end
end
