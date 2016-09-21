class UserTracksAssociationsController < ApplicationController
	before_action :authenticate_user!
	def create
		if current_user && params[:id]
			new_track = Track.find_by(:id => params[:id])
			current_user.tracks.push(new_track)

			redirect_to dashboard_path
		end

	end
end
