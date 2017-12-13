Rails.application.routes.draw do

  get 'maps/index'
  root 'top#index'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  resources :insts do
    resources :comments
    post :confirm, on: :collection
    get 'find', on: :collection
    post 'find', on: :collection

    member do
      get 'apply_user'
      get 'permit'
      get 'deny'
    end
  end

  resources :howtos, only: [:index] do

  end

  resources :myps, only: [:index, :new, :create, :edit, :update, :show] do
    member do
      get 'apply_store'
      get 'cancel_store'
    end
    collection do
      post :confirm
    end
  end

  resources :conversations do
    resources :messages
  end

  resources :pictures, only: [:index, :edit, :destroy, :update]

  resources :relationships, only: [:create, :destroy]

  devise_for :users, controllers: {
    registrations: "users/registrations",
    omniauth_callbacks: "users/omniauth_callbacks"
  }

  resources :users, only: [:index, :show]

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

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
