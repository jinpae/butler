class TodoItemsController < ApplicationController
	before_action :authenticate_user!
	before_action :set_todo_list

	def create
		@todo_item = @todo_list.todo_items.new(todo_item_params)

		if @todo_item.save
			redirect_to @todo_list, notice: "New todo item has been created successfully!"
		else
			render "todo_lists/show"
		end
	end

	private
		def set_todo_list
			@todo_list = current_user.todo_lists.find(params[:todo_list_id])
		end

		def todo_item_params
			params.require(:todo_item).permit(:content)
		end
end
