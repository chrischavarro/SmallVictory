class AddCountColumnToTaskType < ActiveRecord::Migration[5.0]
  def change
  	add_column :task_types, :count, :integer
  end
end
