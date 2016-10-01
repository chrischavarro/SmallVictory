class UserTracksAssociationsController < ApplicationController
	before_action :authenticate_user!
	def create
		if current_user && params[:id]
			new_track = Track.find_by(:id => params[:id])
			current_user.tracks.push(new_track)

			if current_user.first_time_user?
				redirect_to new_track_task_type_path(new_track.id)
				
			else
				redirect_to dashboard_path
			end
		end

	end
end
