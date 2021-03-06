Rails.application.routes.draw do
  get "/pages/:page" => "pages#show"
  #root to: redirect('/users/sign_in')
  devise_for :users, :controllers => { registrations: 'registrations' }
  devise_scope :user do
    authenticate :user do
      resources :events
      resources :challenges
      resources :competitions
      resources :users
      get 'join/:id', to: 'competitions#join'
    end
    authenticated :user do
      root 'competitions#index'
    end
    unauthenticated do
      root to: redirect('/users/sign_in')
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
