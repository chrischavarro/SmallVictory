class TasksController < ApplicationController
	def new
		@track = Track.find_by(id: params[:track_id])
	end

	def create
		completion = UserTrackCompletionAssociation.new
		completion.user_id = current_user.id
		completion.track_id = params[:track_id]

		if completion.save
			redirect_to dashboard_path
		else
			redirect_to :back
		end
	end
end
