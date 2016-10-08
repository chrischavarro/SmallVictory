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
			if !task_data.include?(label.task.name)
				task_data[label.task.name] = 1
			else
				task_data[label.task.name] += 1
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

	def update
		user_completion = UserCompletion.find_by(id: params[:id])
		unless user_completion
			render json: {error: "User completion not found"},
				status: 404
			return
		end
		user_completion.update(user_completion_params)
		render json: user_completion
	end

	def destroy
		user_completion = UserCompletion.find_by(id: params[:id])
		unless user_completion
			render json: {error: "User completion not found"},
			status: 404
			return
		end
		user_completion.destroy
		render json: user_completion
	end


	private

	def user_completion_params
		params.require(:user_completion)
			.permit(:user_id, :track_id, :task_id, :task_type_id)
	end
end
