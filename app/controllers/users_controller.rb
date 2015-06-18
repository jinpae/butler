class UsersController < ApplicationController
	before_action :authenticate_user!

  def show
		@user = current_user

		if request.path != user_path(@user)
			redirect_to @user, status: :moved_permanently
		end
  end
end
