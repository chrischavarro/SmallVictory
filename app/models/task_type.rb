class TaskType < ApplicationRecord
	has_many :task_type_associations
	has_many :tasks, through: :task_type_associations
	has_many :user_completions
end
