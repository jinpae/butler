class TodoItem < ActiveRecord::Base
  belongs_to :todo_list

	validates :content, presence: true

	def toggle_complete_status
		if completed_at.blank?
			self.completed_at = Time.zone.now
		else
			self.completed_at = nil
		end

		self.save!
	end

	def completed?
		completed_at.present?
	end
end
