Rails.application.routes.draw do
  # resources :product_orders, only: [ :show, :post ]
  # resources :skus
  # resources :product_option_values
  # resources :product_options
  resources :products, only: [ :index ]
  resources :orders, only: [ :create ]
  resources :users, only: [ :index, :show  ]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
