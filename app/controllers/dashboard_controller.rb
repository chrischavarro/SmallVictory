class DashboardController < ApplicationController
  before_action :verified_user_has_profile?
  before_action(:authenticate_user!)


	def main
		# respond_to do |format|
		# 	format.json {
		# 		render :json => {
		# 			:completions => completions
		# 		}
		# 	}
		# end

		completions = UserCompletion.where(user_id: current_user.id)
		@completed = []
		@attempted = []
		@user_tracks = current_user.tracks.first
		@tasks = @user_tracks.tasks

		@task_array = []
		@tasks.each do |task|
			@task_array.push(task.name)
		end

		# @task_count_array = []
		# @tasks.each do |task|
		# 	@task_count_array.push(task.count)
		# end

		@task_type_labels = []
			completions.each do |completion|
				@task_type_labels.push(completion.task_type.name)
			end

		@task_type_array = []
			@tasks.each do |task|
				@task_type_array.push(task.task_types)
			end
		
		completions.each do |completion|
			if completion.completed
				@completed.push(completion)
			end
			@attempted.push(completion)
		end

		@completion_percentage = (@completed.count.to_f/@attempted.count.to_f) * 100

	end

	protected
	
	def verified_user_has_profile? 
  		if current_user && !current_user.profile
  			redirect_to after_signup_path(:setup_profile)
  		end
  	end
end

# @task_array2 = []			
		# 	@task_type_array.each do |task|
		# 		@task_array2.push(task.task_type)
		# 	end

		# last = @task_type_array.last
		# @array2 = []
		# last.each do |item|
		# 	@array2.push(item.name)
		# end
		# @task_types = []
		# 	@task_type_array.each do |task_type|
		# 		@task_types.push(task_type.task_types)
		# 	end
    # <!-- WORKING EXAMPLE FOR PULLING TASK TYPE -->
    # <% @array2.each do |array|  %>
    # <%= array %>
    # <% end %>

    #     <!-- USED TO KEEP TRACK OF ALL TASK TYPES ASSOCIATED WITH ALL TASKS -->
    # <ul>
    # <% @task_type_array.each do |task_type| %>
    #   <li>You've done x <%= task_type.name  %> task types</li>
    # <% end %>
    # </ul>

# t.user_completions.where(task_id: 5).count