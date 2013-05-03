TrueHeroes::Application.routes.draw do
  resources :pledges

  get '/auth/:provider/callback', to: 'pledges#create'

  match '/why', to: 'static_pages#why'
  root          to: 'static_pages#home'
end
