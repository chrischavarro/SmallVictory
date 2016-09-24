class AfterSignupController < ApplicationController
	include Wicked::Wizard

	steps :setup_profile, :select_track, :complete_first_task

	def show
		@user = current_user
		@profile = Profile.new
		@tags = Tag.all

		# From Tracks Controller
		@user_tags = current_user.tags.pluck(:id)
		@tracks = Track.joins(:tag_associations).where("tag_associations.id IN (?)", @user_tags)
		@unique_tracks = @tracks.distinct
		@track = Track.find_by(id: params[:track_id])


		render_wizard
	end

	def update
		@user = current_user

		render_wizard
	end




end
