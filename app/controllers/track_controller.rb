class TrackController < ApplicationController

	def select
		@track = Track.all
	end

	private

	def required_params
		params.require(:track).permit(:name, :description)
	end

end
