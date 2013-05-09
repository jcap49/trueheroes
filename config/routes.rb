TrueHeroes::Application.routes.draw do
  resources :pledges

  ### USERS
  devise_for :users, controllers: { registrations: 'registrations', omniauth_callbacks: 'users/omniauth_callbacks' }
  devise_scope :user do
    get 'signup', to: 'registrations#new'
    get 'login', to: 'devise/sessions#new'
    get 'settings', to: 'registrations#edit'
  end

  ### LinkedServices
  #delete 'settings/services/:provider/disconnect', to: 'linked_services#destroy', as: :remove_linked_service
  #get 'settings/services', to: 'linked_services#index', as: :linked_services
  #get 'auth/:provider/callback', to: 'linked_services#callback'
  #get 'auth/failure', to: 'linked_services#failure'

  match '/why', to: 'static_pages#why'
  root          to: 'static_pages#home'
end
