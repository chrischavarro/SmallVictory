class ProfilesController < ApplicationController

	def new
		@profile = Profile.new
		@tags = Tag.all
	end

	def create
		# current_user.tags << params[:tag]
		@profile = Profile.new(
			user_id: current_user.id,
			wake_up_time: params[:profile][:wake_up_time],
			monday: params[:profile][:monday],
			tuesday: params[:profile][:tuesday],
			wednesday: params[:profile][:wednesday],
			thursday: params[:profile][:thursday],
			friday: params[:profile][:friday],
			saturday: params[:profile][:saturday],
			sunday: params[:profile][:sunday]
			)
		@profile.save

		redirect_to '/'
	end

end
