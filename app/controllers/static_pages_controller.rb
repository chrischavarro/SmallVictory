class StaticPagesController < ApplicationController
	def home
		if user_signed_in? 
			redirect_to dashboard_url
		end
	end

	def TOS

	end

	def privacypolicy
	end

	# def setup
	# 	@tags = Tag.all
	# 	# current_user.tags << params[:tag]
	# 	@profile = Profile.new(
	# 		user_id: current_user.id,
	# 		wake_up_time: params[:wake_up_time],
	# 		monday: params[:monday],
	# 		tuesday: params[:tuesday],
	# 		wednesday: params[:wednesday],
	# 		thursday: params[:thursday],
	# 		friday: params[:friday],
	# 		saturday: params[:saturday],
	# 		sunday: params[:sunday]
	# 		)
	# 	@profile.save

	# 	# redirect_to '/'
	# end
end
