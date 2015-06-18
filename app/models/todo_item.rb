class TodoItem < ActiveRecord::Base
	extend FriendlyId
  belongs_to :todo_list

	validates :content, presence: true

	friendly_id :content, use: [:slugged, :finders]

	def should_generate_new_friendly_id?
		new_record? || content_changed?
	end

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
