Rails.application.routes.draw do
  root 'pages#home'
  resources :items
  resources :warehouses do
    resources :warehouse_items, only: %i[create edit destroy update]
  end
end
