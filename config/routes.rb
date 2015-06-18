Rails.application.routes.draw do
	root 'home#index'

  resources :todo_lists do
		resources :todo_items do
			patch :complete, on: :member
		end

		patch :toggle_completed_items, on: :member
	end

	devise_scope :user do
		get 'sign_up' => 'devise/registrations#new'
		get 'sign_in' => 'devise/sessions#new'
		get 'sign_out' => 'devise/sessions#destroy'
	end

  devise_for :users, controllers: {
		registrations: :registrations
	}

	resources :users, only: [:show]
end
