Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :pets, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :interests, only: [:create]
  end

  resources :interests, only: [:index]

  patch '/interests/:id/approve', to: 'interests#approve', as: :approve
  get 'current_location', to: 'locations#create'
  get 'playdates', to: 'interests#playdates', as: :playdate
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
