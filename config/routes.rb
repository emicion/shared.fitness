Rails.application.routes.draw do
  get "/pages/:page" => "pages#show"
  devise_for :users, :controllers => { registrations: 'registrations' }
  devise_scope :user do
    authenticate :user do
      resources :events
      resources :challenges
      resources :competitions
      root 'competitions#index'
      resources :users
    end
    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
