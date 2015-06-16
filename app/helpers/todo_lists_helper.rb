module TodoListsHelper
	def todo_items_info_for(todo_list)
		num_todo_items = todo_list.todo_items.size
		num_todo_items_completed = todo_list.completed_todo_items.size

		percent_completion = 0

		percent_completion = num_todo_items_completed.to_f / num_todo_items.to_f * 100 if num_todo_items > 0
		percent_completion = percent_completion.round

		info = "#{num_todo_items_completed} out of #{pluralize(num_todo_items, 'item')} completed (#{percent_completion}%)"
	end

	def archive_link_to(todo_list)
		if todo_list.hide_completed_items?
			noun = pluralize_without_count @todo_list.completed_todo_items.size, 'item'
			link_text = "Show completed #{noun} (#{todo_list.completed_todo_items.size})"
		else
			link_text = "Hide completed items"
		end

		link_to link_text, toggle_completed_items_todo_list_path(todo_list), remote: true, method: :patch, id: 'toggle-completed-items-btn'
	end
end
