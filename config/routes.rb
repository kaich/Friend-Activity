Rails.application.routes.draw do

  root to: 'welcome#index'
  devise_for :users, path: "auth", path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'regist' }

  namespace :users do 
    get ':id/information' , to: 'information#show' , as: 'show_information'
    get 'information' , to: 'information#edit'
    put 'information' , to: 'information#update'
  end
  
  resources :favorites 
    
  resources :notifications


  resources :groups  ,except: :destroy do 
    collection do
      get :search , :action => "search" , :as => "search"
    end

    resources :applications do
      member do
        patch :agree
        patch :reject
      end
    end

    resources :activities ,except: :destroy do
      collection do 
        post :preview
      end

      member do 
        patch :track
        patch :untrack
        patch :participate
        patch :dropout
        patch :upvotes
        patch :downvotes
      end

      resources :events , shallow: true 
      resources :comments , shallow: true
    end
  end

#not use member , params[:event_id] rather than params[:id]
  resources :events ,except: :destroy do 
    patch :upvotes
    patch :downvotes
  end

  get 'markdown' => 'home#markdown', as: 'markdown'


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
