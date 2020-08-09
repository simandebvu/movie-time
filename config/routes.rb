Rails.application.routes.draw do
  resources :opinions, :only =>[:create, :show]
  root to: "opinions#index"
  resources :statistics, :only =>[:index]
  devise_for :users, :path_prefix => 'd', :controllers=> {registrations:'registrations'}
  get 'users/index'
  post '/users/:id/follow', to: 'users#follow', as: 'follow'
  delete '/users/:id/unfollow', to: 'users#unfollow', as: 'unfollow'
  resources :users, :only =>[:show]
  get 'user_posts' => 'opinions#show_users_posts'
  match '/users', to: 'users#index', via: 'get'
  match '/users/:id', to: 'users#show', via: 'get'
end
