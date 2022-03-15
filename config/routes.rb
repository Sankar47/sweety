Rails.application.routes.draw do
  devise_for :users

  # Defines the root path route ("/")
  devise_scope :user do
    authenticated :user do
      root 'glucose_levels#index', as: :authenticated_root
    end
  
    unauthenticated do
      root 'home#index', as: :unauthenticated_root
    end
  end

  resources :glucose_levels, only: [:index,  :create, :new]
end
