class DashboardController < ApplicationController
  before_action :verified_user_has_profile?

	def main
		# @user = User.find_by(params[:id])
		
	end

	protected
	
	def verified_user_has_profile? 
  		if current_user && !current_user.profile
  			redirect_to new_profile_path
  		end
  	end
end
