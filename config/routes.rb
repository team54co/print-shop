Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
# resources :orders
# resources :clients
resources :clients do
  resources :orders
end
resources :orders do
  resources :ordered_products
end

resources :products do
  resources :orders
end
end
