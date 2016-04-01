Rails.application.routes.draw do
  get '/' => 'pages#index', as: :home
	get '/profile/search' => 'users#profile_search', as: :p_search
	get '/profile/search/:search_by/:search_term' => 'users#profile_search'
	get '/profile/:username' => 'users#profile', as: :profile
	get '/profile/:username/major' => 'users#major_reqs', as: :user_major
	get '/users/:username/edit' => 'users#edit', as: :edit_user
	get '/cart' => 'users#cart', as: :cart
  get '/search' => 'pages#search', as: :search
  get '/search/:semester/:subject' => 'pages#search'
	get '/search/:semester/:subject/:wqb' => 'pages#search'
  get '/search/:semester/:subject/:coursenum/:sort' => 'pages#search'
	get '/search/:semester/:subject/:coursenum/:sort/:wqb' => 'pages#search'
  get '/course/:semester/:subject/:coursenum/:section' => 'pages#course'
	get '/schedule/:username' => 'users#schedule', as: :schedule
  get '/signup' => 'users#new', as: :signup
  get '/login' => 'access#login', as: :login  
  post   'login'   => 'access#attempt_login'
  delete 'logout' => 'access#logout'
  resources :users
  root 'pages#index'
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

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
