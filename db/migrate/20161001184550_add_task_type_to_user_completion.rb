class AddTaskTypeToUserCompletion < ActiveRecord::Migration[5.0]
  def change
  	add_column :user_completions, :task_type_id, :integer
  end
end
