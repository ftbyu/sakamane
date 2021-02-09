Rails.application.routes.draw do

  devise_for :players,
  controllers: {
      sessions: 'devise/players/sessions',
      passwords: 'devise/players/passwords',
      registrations: 'devise/players/registrations',
  }

  devise_for :managers,
  controllers: {
    sessions: 'devise/managers/sessions',
    passwords: 'devise/managers/passwords',
    registrations: 'devise/managers/registrations',
  }

  root 'home#top'

  namespace :admin do
    resource :managers do
      resources :players
      resources :games do
        resources :results do
          collection do
            patch :update_all
          end
        end
        member do
          get :score
        end
      end
    end
  end

  namespace :public do
    resources :managers
    resources :players
    resources :games
  end

end
