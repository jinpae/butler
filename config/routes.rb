Rails.application.routes.draw do
  resources :todo_lists do
		resources :todo_items do
			patch :complete, on: :member
		end
	end

  devise_for :users

	root 'home#index'
end
