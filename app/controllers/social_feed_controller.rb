class SocialFeedController < ApplicationController

	def show
		@users = User.includes(:user_completions).order("user_completions.created_at DESC")
	end

end
