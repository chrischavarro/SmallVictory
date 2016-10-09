class UserCompletionsController < ApplicationController
	  protect_from_forgery with: :null_session
	  # before_action :authenticate_user!, only:[:generate_doughnut_chart_data]

	def generate_doughnut_chart_data
		# CHANGE TO CURRENT_USER AFTER DONE TESTING
		@user = User.last
		@start_date = ""
		if params[:start_date]
			@start_date = params[:start_date] 
		else
			@start_date = @user.created_at
		end
		user_completions = @user.user_completions.where("created_at > ?", @start_date)
		task_data = {}
		user_completions.each do |label|
			print task_data
			if !task_data.include?(label.task.name)
				task_data[label.task.name] = 1
			else
				task_data[label.task.name] += 1
			end
		end

		render json: task_data
	end

	def generate_radar_chart_data
		@user = User.last
		@start_date = ""
		if params[:start_date]
			@start_date = params[:start_date] 
		else
			@start_date = @user.created_at
		end
		user_completions = @user.user_completions.where("created_at > ?", @start_date)
		completion_data = {}
		user_completions.each do |label|
			print completion_data
			if !completion_data.include?(label.task.name)
				completion_data[label.task.name] = 1
			else
				completion_data[label.task.name] += 1
			end
		end

		# user_attempts = @user.user_completions.where(!:completed)
		user_attempts = @user.user_completions.where(:completed => true) 
		# user_attempts = @user.user_completions.where(not_completed)
		# user_attempts = @user.user_completions.where("created_at > ? AND :completed => ?", @start_date, false)
		attempt_data = {}
		user_attempts.each do |label|
			# print attempt_data
			if !attempt_data.include?(label.task.name)
				attempt_data[label.task.name] = 1
			else
				attempt_data[label.task.name] += 1
			end
		end

		render json: [completion_data, attempt_data]
	end

	def generate_line_chart_data
		@user = User.last
		@start_date = ""
		if params[:start_date]
			@start_date = params[:start_date] 
		else
			@start_date = @user.created_at
		end
		user_completions = @user.user_completions.where("created_at > ?", @start_date)
		task_data = {}
		user_completions.each do |label|
			print task_data
			if !task_data.include?(label.task_type.name)
				task_data[label.task_type.name] = 1
			else
				task_data[label.task_type.name] += 1
			end
		end

		render json: task_data
	end


	def index
		user_completions = User.last.user_completions
		task_type = user_completions.task_type.name

		render json: task_type
	end

	def create
		user_completion = UserCompletion.create(user_completion_params)
		render json: user_completion
	end

	def show
		user_completion = UserCompletion.find_by(id: params[:id])
		task_type = user_completion.task_type.name
		task = user_completion.task.name
		completion_info = [user_completion, task_type, task]
		unless user_completion
			render json: {error: "User completion not found"},
				status: 404
			return
		end
		render :json => completion_info				
	end

	private

	def user_completion_params
		params.require(:user_completion)
			.permit(:user_id, :track_id, :task_id, :task_type_id)
	end

	# def not_completed
	# 	@user.user_completions.completed => false
	# end
end
