class SocialFeedController < ApplicationController
  before_action(:authenticate_user!)

	def show
		@users_all = User.includes(:user_completions).order("user_completions.created_at DESC")
		@users = @users_all.select do |user|
			user.id != current_user.id
		end
# id: params[:current_user]
	end

end
