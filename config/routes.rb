TrueHeroes::Application.routes.draw do
  resources :pledges

  ### USERS
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }


  match '/why', to: 'static_pages#why'
  root          to: 'static_pages#home'
end
