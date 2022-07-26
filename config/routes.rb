Rails.application.routes.draw do
  root to: 'pages#home'

  devise_for :users

  resources :users, only: [:show, :edit, :update, :delete] do
    resources :posts, except: [:index]
  end
end
