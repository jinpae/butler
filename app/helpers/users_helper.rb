module UsersHelper
	def profile_image_for(user, *css_class)
		url = "https://secure.gravatar.com/avatar/#{user.gravatar_id}"

		image_tag(url, alt: user.full_name, class: css_class)
	end
end
