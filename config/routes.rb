Rails.application.routes.draw do
  root to: 'pages#home'

  devise_for :users

  resources :users, only: [:index, :show, :edit, :update, :delete, :feed] do
    post :add_friend
    resources :posts, except: [:index]
  end

  get '/feed', to: 'users#feed', as: :user_feed
end
