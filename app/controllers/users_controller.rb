class UsersController < ApplicationController
	before_action :authenticate_user!
	before_action :require_admin, except: [:show]

	def index
		@users = User.all.order(:id)
	end

  def show
		@user = current_user

		if request.path != user_path(@user)
			redirect_to @user, status: :moved_permanently
		end
  end

	def destroy
		@user = User.find(params[:id])
		
		if @user.destroy
			redirect_to users_path, notice: "User deleted successfully."
		end
	end
end
