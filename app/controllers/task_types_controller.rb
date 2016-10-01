class TaskTypesController < ApplicationController
	def new
		@track = Track.find_by(id: params[:track_id])
		@task = @track.tasks.sample
		@prompt = ""
		if current_user.first_time_user
			@prompt = "Let's get started with your first task!"
		else
			@prompt = "Your task for today:"
		end
	end

	def create
		completion = UserTrackCompletionAssociation.new
		completion.user_id = current_user.id
		completion.track_id = params[:track_id]
		# This is where to decide how long task took, whether or not it was completed, etc
		completion.completed = true
		if completion.save
			redirect_to dashboard_path
		else
			redirect_to :back
		end

	end
end


