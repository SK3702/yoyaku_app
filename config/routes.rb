Rails.application.routes.draw do
  root to: 'homes#top'

  devise_for :users
  get 'users/account' => 'users#show'
  resources :profile, :users, :reservations
  post 'reservations/confirm' => 'reservations#confirm'


  get 'rooms/own' => 'rooms#own'
  
  resources :rooms do
    collection do
      get 'search'
    end
    resources :reservations
  end
end
