ActionController::Routing::Routes.draw do |map|
  
  # CLIENT ROUTES
  map.essay_index 'essays.:format',  :controller => 'essays',
                                     :action     => 'index',  
                                     :conditions => { :method => :get}


  map.essay_show 'essays/:title.:format',  :controller => 'essays',
                                           :action     => 'show',  
                                           :conditions => { :method => :get}

  map.essay_update 'essays/:title.:format',  :controller => 'essays',
                                             :action     => 'update',  
                                             :conditions => { :method => :put}
  
  # HTML CRUD
  map.essay_new 'new/essay/',  :controller => 'essays',
                               :action     => 'new',  
                               :conditions => { :method => :get}
  
  map.essay_edit 'edit/essay/:title',  :controller => 'essays',
                                       :action     => 'edit',  
                                       :conditions => { :method => :get}


  # Esto crea las rutas para POST, PUT, DESTROY de un recurso, creo 
  map.resources :users do |users|
    users.resources :essays
  end
  
  
  # LOWEST PRIORITY
  map.with_options :controller => 'essays' do |m|
    m.with_options :conditions => { :method => :get } do |get|
      # Se deben de tener vistas separadas o debo de usar las mismas para todo???
      get.hexagon_essays ':username/essays', :action => 'hexagon_index'
      get.hexagon_essays ':username/essays/:title.:format',     :action => 'hexagon_show' 
      # get.essays ':username/new/essay/',        :action => 'new' 
      # get.essays ':username/edit/essay/:title', :action => 'edit' 
    end
  end

  map.resource :account, :controller => "users"

  # FIXME: Para que tengo esta ruta???
  map.resources :users          
  map.resource :user_session

  # USER'S HEXAGON HOME SHOULD HAVE THE LOWEST PRIORITY
  map.with_options :controller => 'homepage' do |m|
    m.with_options :conditions => { :method => :get } do |get|
      get.hexagon_home ':username/', :action => 'hexagon_home'
    end
  end

  map.root :controller => "homepage", :action => "home"

  # muy bonito pero asi no se hace...
  # deberia de ser anidada, como user has_many essays.

  # no se porque no sirvieron estas...
  # map.user_essays 'user/essays/',  :controller => 'essays',
  # :action     => 'index',  
  # :conditions => { :method => :get}
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

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
