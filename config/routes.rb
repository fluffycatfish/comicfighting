Comicfighting::Application.routes.draw do
  resources :round_participations

  resources :replies

  resources :battle_participations

  resources :tournament_participations

  resources :tournaments do
    resources :rounds do
      resources :battles
    end
  end

  resources :profile_pics

  resources :character_sheets

  resources :characters
  resources :profiles

  get "sessions/new"
  get "registrations/new"
  get "static_pages/home"
  get "static_pages/about"
  get "static_pages/admin"


  post "profiles/:id/make_admin", to: 'profiles#make_admin'

  post "tournaments/:id/start_tournament", to: 'tournaments#start_tournament'
 
  # Rounds selecting participants
  post "rounds/:id/allow_participation_tournament/:tournament_participation_id", 
    to: 'rounds#allow_participation_tournament'
  post "rounds/:id/allow_participation_round/:round_participation_id", 
    to: 'rounds#allow_participation_round'

  devise_for :users, :controllers => {:registrations => "registrations", :sessions => "sessions"}
    # , :path_names { :sign_up => "register" }
    
  root 'static_pages#home'

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
