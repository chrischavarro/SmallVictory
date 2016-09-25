class ProfilesController < ApplicationController
before_action(:authenticate_user!)

	def new
		@profile = Profile.new
		@tags = Tag.all
	end

	def update
		profile = current_user.profile
		profile.update!(profile_params)
			redirect_to dashboard_path

	end

	def show
		params[:tags].each_with_index do |(tag, value), index|
			p tag
			p "Tag: #{tag}, value: #{value}, index: #{index}\n"
			if tag.to_i 
				new_tag = Tag.find_by(:id => tag.to_i)
				current_user.tags.push(new_tag)	
			end
		end

		@profile = current_user.profile
		@tags = Tag.all

	end

	def create
		params[:tags].each_with_index do |(tag, value), index|
			p tag
			p "Tag: #{tag}, value: #{value}, index: #{index}\n"
			if tag.to_i 
				new_tag = Tag.find_by(:id => tag.to_i)
				current_user.tags.push(new_tag)	
			end

		end
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

		redirect_to '/after_signup/select_track'
	end

	private

	def profile_params
		params.require(:profile).permit(:wake_up_time, :monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday)
	end

end
