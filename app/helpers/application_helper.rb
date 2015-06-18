module ApplicationHelper
	def pluralize_without_count(count, singular, plural = nil)
		((count == 1 || count =~ /^1(\.0+)?$/) ? singular : (plural || singular.pluralize))
	end

	def home_page?
		@result ||= (controller_name == 'home') && (action_name == 'index')
	end

	def title(page_title)
		content_for :title, page_title.to_s
	end
end
