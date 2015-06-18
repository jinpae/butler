Rails.application.routes.draw do
	root 'home#index'

	resources :todo_lists, only: [:new]

  resources :todo_lists, path: :lists, except: [:new] do
		resources :todo_items, path: :items do
			patch :complete, on: :member
		end

		patch :toggle_completed_items, on: :member
	end

	#devise_scope :user do
	#	get 'sign_up' => 'devise/registrations#new'
	#	get 'sign_in' => 'devise/sessions#new'
	#	get 'sign_out' => 'devise/sessions#destroy'
	#end

	devise_for :users, skip: [:registrations]
	as :user do
		post 'users' => 'registrations#create', as: 'user_registration'
		get 'users/sign_up' => 'registrations#new', as: 'new_user_registration'
		get 'users/edit' => 'registrations#edit', as: 'edit_user_registration'
		patch 'users' => 'registrations#update', as: ''
		put 'users' => 'registrations#update', as: ''
		delete 'users' => 'registrations#destroy', as: ''
	end

	resources :users, path: '', only: [:show]
end
