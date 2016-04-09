Rails.application.routes.draw do
  devise_for :users
  # The priority is based upon order of creation: first created -> highest priority.

  # root 'welcome#index'
  root 'pages#welcome'

  #   get 'products/:id' => 'catalog#view'
  get "/search" => 'pages#search', as: 'search'
  get "/admin" => 'pages#admin'
  get "/order_details" => 'pages#order_details'
  
  get "/excel", to: 'pages#excel', as: 'excel'
  get "/excel_download", to: 'pages#excel_download', as: 'excel_download'

  get "/sub_categories" => 'products#sub_categories'
  get "/detail_categories" => 'products#detail_categories'

  get "/buy_now" => 'order_items#buy_now', as: 'buy_now'

  #   resources :products
  resources :companies do
    resources :products, only: [:new,:create,:edit,:update,:destroy]
  end

  resources :products, only: [:show]
  resource :cart, only: [:show]
  resource :order, only: [:update]
  resources :order_items, only: [:create, :update, :destroy]
  resources :shipping_details, only: [:new, :create]
  get "/shipping_details" => 'shipping_details#new'

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
