Rails.application.routes.draw do

  root 'lessons#main'
  get 'lessons/materials', to: 'lessons#materials', as: 'materials_lesson'
  get 'lessons/quiz', to: 'lessons#quiz', as: 'quiz_lesson'
  get 'lessons/dragndrop', to: 'lessons#dragndrop', as: 'dragndrop_lesson'
  get 'lessons/raspi', to: 'lessons#raspi', as: 'raspi_lesson'
  get 'lessons/setup', to: 'lessons#setup', as: 'setup_lesson'
  get 'lessons/code', to: 'lessons#code', as: 'code_lesson'
  get 'lessons/html', to: 'lessons#html', as: 'html_lesson'
  get 'lessons/leaderboard', to: 'lessons#leaderboard', as: 'leaderboard'

  # get 'questions#index'
  get 'forum', to: 'questions#index', as: 'forum_questions'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  get '/signup', to: 'users#new'
  post '/users', to: 'users#create'
  post '/update_score', to: 'users#update_score'
  get 'tags/:tag', to: 'questions#index', as: :tag
  # get '/questions/new' => 'questions#new'
  # post '/questions/create' => 'questions#create'


  resources :questions do
    resources :answers do
      post 'upvote'
    end
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
