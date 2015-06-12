module TodoItemsHelper
	def link_to_toggle_status(todo_list, todo_item, *classes)
		if todo_item.completed?
			classes << :complete
		else
			classes << :incomplete
		end

		link_to complete_todo_list_todo_item_path(todo_list, todo_item), method: :patch, class: classes do
			content_tag :i, nil, class: 'fa fa-check'
		end
	end

	def style_content(todo_item, *classes)
		content = todo_item.content
		
		if todo_item.completed?
			content = content_tag :strike, todo_item.content
			classes << 'complete'
		end

		content_tag :p, content, class: classes
	end
end
