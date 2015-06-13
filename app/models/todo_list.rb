class TodoList < ActiveRecord::Base
  belongs_to :user
	has_many :todo_items, dependent: :destroy

	validates :title, presence: true

	def completed_todo_items
		todo_items.where.not(completed_at: nil)
	end
end
