TrueHeroes::Application.routes.draw do
  resources :pledges


  match '/why', to: 'static_pages#why'
  root          to: 'static_pages#home'
end
