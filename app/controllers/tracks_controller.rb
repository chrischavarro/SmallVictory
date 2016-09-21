class TracksController < ApplicationController

	def select
		@user_tags = current_user.tags.pluck(:id)
		@tracks = Track.joins(:tag_associations).where("tag_associations.id IN (?)", @user_tags)
		@unique_tracks = @tracks.uniq
	end

	private

	def required_params
		params.require(:track).permit(:name, :description)
	end

end
