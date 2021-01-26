Rails.application.routes.draw do
  devise_for :managers,
  controllers: {
    sessions: 'devise/managers/sessions',
    passwords: 'devise/managers/passwords',
    registrations: 'devise/managers/registrations',
  }

  root 'home#top'

  namespace :manager do
  end

end
