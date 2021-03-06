class User < ActiveRecord::Base
	extend FriendlyId
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	has_many :todo_lists, dependent: :destroy

	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :username,
		presence: true,
		length: { minimum: 6 },
		format: /\A([A-Z0-9]+[-_]*[A-Z0-9])+\z/i,
		uniqueness: {
			case_sensitive: false
		}
	
	friendly_id :username, use: [:slugged, :finders]

	def should_generate_new_friendly_id?
		new_record? || username_changed?
	end

	def full_name
		@full_name ||= "#{first_name} #{last_name}"
	end

	def todo_items
		@todo_items = 0

		todo_lists.each do |todo_list|
			@todo_items += todo_list.todo_items.size
		end

		@todo_items
	end

	def completed_items
		@completed_items = 0

		todo_lists.each do |todo_list|
			@completed_items += todo_list.todo_items.where.not(completed_at: nil).size
		end

		@completed_items
	end

	def gravatar_id
		Digest::MD5::hexdigest(email.downcase)
	end
end
