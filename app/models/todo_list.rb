class TodoList < ActiveRecord::Base
	extend FriendlyId

  belongs_to :user
	has_many :todo_items, dependent: :destroy

	validates :title, presence: true

	friendly_id :title, use: [:slugged, :finders]

	def should_generate_new_friendly_id?
		new_record? || title_changed?
	end

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
