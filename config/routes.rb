Rails.application.routes.draw do
  root to: 'pages#home'

  devise_for :users

  resources :users, only: [:index, :show, :edit, :update, :delete, :feed] do
    post :add_friend
    post :accept_friend
    post :reject_friend
    
    get :friend_requests
    resources :posts, except: [:index]
  end

  get '/feed', to: 'users#feed', as: :user_feed
end
