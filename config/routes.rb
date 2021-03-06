Rails.application.routes.draw do
  root 'welcome#index'
  get '/signup' => 'students#new'
  post '/signup' => 'students#create'
  
  get    '/login' => 'sessions#new'
  post   '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  get 'courses/:course_id/applications/:application_id/questionnaires/:type/review' => 'questionnaires#review', as: :review


  # get 'courses/:course_id/applications/new' => 'applications#new'
  # get 'courses/:course_id/applications/:application_id/edit' => 'applications#edit'
  # post 'courses/:course_id/applications/:application_id' => 'applications#update'
  # get 'courses/:course_id/applications/:application_id' => 'applications#show'

  # resources :applications
  # We'll want to remove the non-nested :applications resource
  # eventually but I'm leaving it in for now to prevent the scaffolded 
  # applications views from getting angry before we're ready to fix them.
  resources :students
  resources :employees

  resources :courses do 
    resources :applications do 
      resources :questionnaires, only: [:new, :create, :show]
    end
    resources :questionnaires, only: [:edit, :update, :show]
  end

  patch 'questionnaires/:questionnaire_id/questions/:id' => 'questions#update'
  post 'questionnaires/:questionnaire_id/questions' => 'questions#create'
  delete 'questionnaires/:questionnaire_id/questions/:id' => 'questions#destroy'

  post 'applications/:application_id/answers' => 'answers#create'


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
