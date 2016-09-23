class Task < ApplicationRecord
	has_many :task_track_associations
	has_many :tracks, through: :task_track_associations
end
