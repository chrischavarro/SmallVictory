class TaskTypeTrackAssociation < ApplicationRecord
	belongs_to :task
	belongs_to :track
end
