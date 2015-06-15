class TodoItemsController < ApplicationController
	before_action :authenticate_user!
	before_action :set_todo_list
	before_action :set_todo_item, except: [:create]

	def create
		@todo_item = @todo_list.todo_items.new(todo_item_params)

		if @todo_item.save
			redirect_to @todo_list
		else
			render "todo_lists/show"
		end
	end

	def edit
	end

	def update
		if @todo_item.update(todo_item_params)
			redirect_to @todo_list
		else
			render :edit
		end
	end

	def destroy
		@todo_item.destroy

		redirect_to @todo_list
	end

	def complete
		@todo_item.toggle_complete_status
		
		redirect_to @todo_list
	end

	private
		def set_todo_list
			@todo_list = current_user.todo_lists.find(params[:todo_list_id])
		end

		def set_todo_item
			@todo_item = @todo_list.todo_items.find(params[:id])
		end

		def todo_item_params
			params.require(:todo_item).permit(:content)
		end
end
