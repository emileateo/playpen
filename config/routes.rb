Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :pets, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :interests, only: [:create]
  end

  resources :interests, only: [:index]

  patch '/interests/:id/approve', to: 'interests#approve', as: :approve

  get 'playdates', to: 'interests#playdates', as: :playdate
  get 'blogpost1', to: 'pages#blogpost1', as: :blogpost1
  get 'blogpost2', to: 'pages#blogpost2', as: :blogpost2
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
