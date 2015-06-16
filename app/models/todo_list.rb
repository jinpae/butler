class TodoList < ActiveRecord::Base
  belongs_to :user
	has_many :todo_items, dependent: :destroy

	validates :title, presence: true

	def completed_todo_items
		@completed_todo_items ||= todo_items.where.not(completed_at: nil)
	end

	def completed?
		todo_items.size > 0 && completed_todo_items.size == todo_items.size
	end

	def toggle_hide_completed_items
		self.hide_completed_items = self.hide_completed_items ? false : true
		self.save!
	end
end
