# frozen_string_literal: true

Rails.application.routes.draw do
  root 'welcome#index'
  get '/about', to: 'about#show'

  get '/login', to: 'visitors/sessions#new'

  get '/search', to: 'search#index'
  get '/search/details', to: 'search#show'

  delete '/logout', to: 'sessions#destroy'

  get '/auth/:provider/callback', to: 'sessions#googleAuth'
  get '/auth/failure', to: redirect('/')

  get '/profile/questionaire', to: 'profiles#new'
  post '/profile', to: 'profiles#create'

	namespace :user do
		get '/mygardens', to: 'mygardens#index'
		get '/mygardens/new', to: 'mygardens#new'
		post '/mygardens', to: 'mygardens#create'
		get '/mygardens/:id', to: 'mygardens/plants#index'

		post '/plants', to: 'plants#create'
		get '/plants/:id/mygardens', to: 'mygardens#show', as: 'plants_mygardens'

		namespace :mygardens do
			post '/:garden_id/plants/:plant_id', to: 'plants#create', as: 'plants'
		end		
	end
end
