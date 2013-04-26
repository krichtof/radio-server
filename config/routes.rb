Kigendan::Application.routes.draw do

  root :to => 'static_pages#home'
  match '/live', :to => 'static_pages#live'

  match '/login' => 'sessions#new', 
        :via => :get
  match '/login' => 'sessions#create', 
        :via => :post
  match '/logout' => 'sessions#destroy',
        :via => :delete

  resources :tracks, :only => [:index, :new, :create, :update, :destroy], :constraints => { :id => /[0-9]+/ } do
    get 'page:page', :action => :index, :on => :collection
  end

  resources :playlists, :only => [:index, :new, :create, :show, :update, :destroy], :constraints => { :id => /[0-9]+/ } do
    get 'page:page', :action => :index, :on => :collection
  end

  match '/on_publish_done', :to => 'static_pages#on_publish_done'
  match '/enable_live', :to => 'static_pages#enable_live'
  match '/disable_live', :to => 'static_pages#disable_live'

end
