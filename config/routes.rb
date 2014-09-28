Rails.application.routes.draw do
  
  resources :pages

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, path_names: {sign_in: "login", sign_out: "logout", sign_up: "register"},
              controllers: {invitations: "users/invitations",
                            omniauth_callbacks: "users/omniauth_callbacks",
                            registrations: "users/registrations",
                            sessions: "users/sessions",
                            confirmations: "users/confirmations"
                          }
  root 'home#index'
  get 'home/index'
  get 'personal_user' => 'home#personal_user', as: :personal_user
  get 'personal_address' => 'home#personal_address', as: :personal_address
  get 'about' => 'home#about', as: :about
  get 'i_wanna' => 'home#i_wanna', as: :i_wanna
  get 'terms' => 'home#terms', as: :terms
  get 'privacy' => 'home#privacy', as: :privacy
  get 'orders/complete' => 'home#complete', as: :complete_order
  get 'stuff/local' => 'home#local', as: :local
  get 'stuff/getaway' => 'home#getaway', as: :getaway
  get 'stuffs/:type' => 'stuffs#index', as: :stuffs
  resources :vouchers, only: [:index]
  resources :subscriptions, only: [:new, :create]
  resources :orders, except: [:show, :edit, :update]
  resources :wishlists, except: [:update, :edit]
  resources :line_items
  resources :carts, only: [:create, :show, :destroy]
  resources :tours, only: [:show, :index]
  resources :stuffs, only: [:show]
  resources :messages, except: [:edit, :update, :destroy]
  resources :get_in_touches, except: [:show, :edit, :update, :destroy]
  match '/admin/*path' => redirect('/admin'), via: :get
  match '*path' => redirect('/'), via: :get
end
