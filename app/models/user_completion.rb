class UserCompletion < ApplicationRecord
	belongs_to :user
	belongs_to :track
	belongs_to :task
	belongs_to :task_type
end
