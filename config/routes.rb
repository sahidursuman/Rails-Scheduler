DevSchedulerCom::Application.routes.draw do

  #http://strugglingwithruby.blogspot.de/2009/12/using-sub-directories-in-rails-projects.html
 #http://stackoverflow.com/questions/7583898/grouping-controller-in-subdirectories-for-nested-resources
  #http://www.jacopretorius.net/2012/01/restful-routing-in-rails-3.html

  root :controller => 'access', :action => :index
  match '/calendar' => 'access#calendar_menu', :via => :get, :as => 'calendar_menu'
  match '/calendar' => 'access#login_attempt', :via => :post
  match '/calendar/:month' => 'access#new_month', :as => 'calendar_month'

  resources :appointments


  #root :to => "app#index"

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end
  # Sample resource route with more complex sub-resources

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  #http://railsforum.com/viewtopic.php?id=38460
  namespace :admin do
    root :to => 'admin#index'
    resources :user
  end
  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
  #match 'admin' => 'admin#index'

end
