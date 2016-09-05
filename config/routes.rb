Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, :controllers => { registrations: 'registrations'}
	root to: 'static_pages#home'

	get '/dashboard' => 'dashboard#main'
	get '/track' => 'track#select'
	get '/setup' => 'static_pages#setup'
end
