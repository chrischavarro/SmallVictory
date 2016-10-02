class UserCompletionsController < ApplicationController
	  protect_from_forgery with: :null_session

	def index
		user_completions = UserCompletion.all
		render json: user_completions
	end

	def create
		user_completion = UserCompletion.create(user_completion_params)
		render json: user_completion
	end

	def show
		user_completion = UserCompletion.find_by(id: params[:id])
		unless user_completion
			render json: {error: "User completion not found"},
				status: 404
			return
		end
		render json: sandwich
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
