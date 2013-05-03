TrueHeroes::Application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :pledges

  get '/auth/:provider/callback', to: 'pledges#create'

  match '/why', to: 'static_pages#why'
  root          to: 'static_pages#home'
end
