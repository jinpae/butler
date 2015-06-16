module TodoItemsHelper
	def content_tag_for(todo_item, *css_classes, &block)
		if todo_item.completed?
			css_classes << 'complete'

			if todo_item.todo_list.hide_completed_items?
				style = 'display: none;'
			else
				style = 'display: block;'
			end
		else
			css_classes << 'incomplete'
		end

		content_tag :div, id: dom_id(todo_item), class: css_classes, style: style do 
			capture(&block)
		end
	end
end
