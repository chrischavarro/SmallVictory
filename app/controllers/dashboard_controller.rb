class DashboardController < ApplicationController
  before_action :verified_user_has_profile?
  before_action(:authenticate_user!)


	def main
		respond_to do |format|
			format.html
			format.json 
		end

		completions = UserTrackCompletionAssociation.where(user_id: current_user.id)
		@completed = []
		@attempted = []
		completions.each do |completion|
			if completion.completed
				@completed.push(completion)
			end
			@attempted.push(completion)
		end

		@completion_percentage = (@completed.count.to_f/@attempted.count.to_f) * 100

	end

	protected
	
	def verified_user_has_profile? 
  		if current_user && !current_user.profile
  			redirect_to after_signup_path(:setup_profile)
  		end
  	end
end
