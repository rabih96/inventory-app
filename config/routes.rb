Rails.application.routes.draw do
  get 'warehouse_items/create'
  root 'pages#home'
  resources :items
  resources :warehouses do
    resources :warehouse_items, only: %i[create edit destroy update]
  end
end
