Rails.application.routes.draw do
  root 'pages#home'
  resources :items
  resources :warehouses
end
