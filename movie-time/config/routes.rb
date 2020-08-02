Rails.application.routes.draw do
  devise_for :users, :controllers=> {registrations:'registrations'}
  resources :opinions
  root to: "opinions#index"
end
