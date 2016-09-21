Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, :controllers => { registrations: 'registrations', :omniauth_callbacks => 'users/omniauth_callbacks'}
	root to: 'static_pages#home'

	get '/dashboard' => 'dashboard#main'
	get '/tracks' => 'tracks#select'
	get '/setup' => 'static_pages#setup'
	get '/termsofservice' => 'static_pages#TOS'
	get '/privacypolicy' => 'static_pages#privacypolicy'

	get '/assign_track/:id' => 'user_tracks_associations#create', as: 'user_track'
	resources :profiles
	resources :tracks do
		resources :tasks
	end
	
end
