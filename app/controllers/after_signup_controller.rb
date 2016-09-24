class AfterSignupController < ApplicationController
	include Wicked::Wizard

	steps :setup_profile, :select_track, :complete_first_task

	def show
		@user = current_user

		render_wizard
	end

	def setup
		@user = current_user

		render_wizard
	end

	def create

	end

end
