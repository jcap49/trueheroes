TrueHeroes::Application.routes.draw do

  match '/why', to: 'static_pages#why'

  root         to: 'static_pages#home'
end
