Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: :registrations}
  root "pages#show"

  resources :games do
    resources :reviews, only: [:new, :create]
  end
  resources :users
  resources :reviews
  resources :genres
end
