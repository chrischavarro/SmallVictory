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
	resources :after_signup
	resources :profiles
	resources :tracks do
		resources :task_types
	end

	get '/api/doughnut_chart_data/:start_date' => 'user_completions#generate_doughnut_chart_data'
	get '/api/radar_chart_data/:start_date' => 'user_completions#generate_radar_chart_data'
	get '/api/line_chart_data/:start_date' => 'user_completions#generate_line_chart_data'

	
	
end
