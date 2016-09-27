class AddTaskIdAndCountToCompletionsModel < ActiveRecord::Migration[5.0]
  def change
  	add_column :user_track_completion_associations, :task_id, :integer
  	add_column :user_track_completion_associations, :task_count, :integer
  end
end
