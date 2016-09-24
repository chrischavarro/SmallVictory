class AfterSignupController < ApplicationController
	include Wicked::Wizard

	def show
		@user = current_user
		render_wizard
	end
end
