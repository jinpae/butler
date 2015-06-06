class HomeController < ApplicationController
  def index
		# If user has already signed in then just redirect to todo lists view.
		if user_signed_in?
			redirect_to todo_lists_path
		end
  end
end
