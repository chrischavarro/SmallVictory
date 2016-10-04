class TaskTypesController < ApplicationController
	def new
		@track = Track.find_by(id: params[:track_id])
		@task = @track.tasks.sample
		@task_type = @task.task_types.sample
		@prompt = ""
		if current_user.first_time_user
			@prompt = "Let's get started with your first task!"
		else
			@prompt = "Your task for today:"
		end
		if task_completed_today == true
			flash[:notice] = "You've already completed your task for today!"
			redirect_to dashboard_path
		end

	end

	def create
		completion = UserCompletion.new
		completion.user_id = current_user.id
		completion.track_id = params[:track_id]
		completion.task_id = params[:task]
		completion.task_type_id = params[:task_type]
		completion.completed = params[:completed]
		# This is where to decide how long task took, whether or not it was completed, etc
		if completion.save
			redirect_to dashboard_path
		else
			redirect_to :back
		end

	end

	private

	def task_completed_today
		completed_at = current_user.user_completions.last.created_at
		DateTime.now.beginning_of_day <= completed_at && completed_at <= DateTime.now.end_of_day
	end


end

# LOGIC TO EXTRACT THE TRACK FROM THE TRACK TYPE
# q = TaskType.last => a task type
# p = q.tasks = Extracting the array of tasks associated with the type, may be only one in the array
# p.each do |item|
# puts item.name
# end