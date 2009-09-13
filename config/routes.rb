ActionController::Routing::Routes.draw do |map|

  # Ruta normal para los recursos /essays/new tiene un overlap ahora pues
  # piensa que es un essay con titulo 'new'
  map.essay_show 'essays/:title.:format',  :controller => 'essays',
                                           :action     => 'show',  
                                           :conditions => { :method => :get}

  map.essay_update 'essays/:title.:format',  :controller => 'essays',
                                             :action     => 'update',  
                                             :conditions => { :method => :put}

  # Routes for the html views only
  map.essay_new 'new/essay/',  :controller => 'essays',
                               :action     => 'new',  
                               :conditions => { :method => :get}

  map.essay_edit 'edit/essay/:title',  :controller => 'essays',
                                       :action     => 'edit',  
                                       :conditions => { :method => :get}

  #   map.resource 'essays/:title.:format',
  #   :controller => 'essays'
  # map.resources :essays, :path_prefix => "/essays/:title.:format"
  
  map.resources :essays

  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  #   map.connect 'essays/:title', :controller => 'essays', :action => 'show'

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller

  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  # map.root :controller => "welcome"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
