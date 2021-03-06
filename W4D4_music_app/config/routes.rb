Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resource :session, only: [:new, :create, :destroy]

  resources :users, only: [:new, :create]

  resources :bands, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  resources :albums, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  resources :tracks, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    member do
      post :notes
    end
  end
  resources :notes, only: [:edit, :update, :destroy]
end
