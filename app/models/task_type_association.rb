class TaskTypeAssociation < ApplicationRecord
	belongs_to :task_type
	belongs_to :task
end
