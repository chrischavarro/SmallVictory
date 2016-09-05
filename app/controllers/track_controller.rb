class TrackController < ApplicationController

	def select

	end

	private

	def required_params
		params.require(:track).permit(:name, :description)
	end

end
