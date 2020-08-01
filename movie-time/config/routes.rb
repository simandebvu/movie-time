Rails.application.routes.draw do
  resources :opinions
  root to: "opinions#index"
end
