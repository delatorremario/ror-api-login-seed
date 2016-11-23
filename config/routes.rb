Rails.application.routes.draw do
  resources :profile
  use_doorkeeper
  devise_for :users,controllers: {
        sessions: 'user/sessions',
        registrations: 'user/registrations',
        passwords:'user/passwords'
      }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
