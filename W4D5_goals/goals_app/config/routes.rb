Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:new, :create, :index, :show] do
    resources :goals, only: [:create, :index, :show]
  end
  resources :goals, only: [:edit, :update, :destroy]

  resource :session, only: [:new, :create, :destroy]
end
