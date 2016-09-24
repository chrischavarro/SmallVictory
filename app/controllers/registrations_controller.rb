class RegistrationsController < Devise::RegistrationsController
	private

		def after_sign_up_path_for(resource)
			after_signup_path(:setup_profile)
		end
end
