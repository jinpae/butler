class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	has_many :todo_lists

	def full_name
		@full_name ||= "#{first_name} #{last_name}"
	end

	def get_total_num_todo_items
		sum = 0

		todo_lists.each do |todo_list|
			sum += todo_list.todo_items.size
		end

		sum
	end

	def get_total_num_completed_items
		sum = 0

		todo_lists.each do |todo_list|
			sum += todo_list.todo_items.where.not(completed_at: nil).size
		end

		sum
	end

	def gravatar_id
		Digest::MD5::hexdigest(email.downcase)
	end
end
