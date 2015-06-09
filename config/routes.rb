Rails.application.routes.draw do
  resources :todo_lists do
		resources :todo_items do
			patch :complete, on: :member
		end
	end

	devise_scope :user do
		get 'sign_up' => 'devise/registrations#new'
		get 'sign_in' => 'devise/sessions#new'
		get 'sign_out' => 'devise/sessions#destroy'
	end

  devise_for :users

	resources :users, only: [:show]

	root 'home#index'
end
