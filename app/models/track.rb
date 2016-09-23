class Track < ApplicationRecord

	has_many :user_track_associations
	has_many :users, through: :user_track_associations

	has_many :user_track_completion_associations

	has_many :task_track_associations
	has_many :tasks, through: :task_track_associations

	has_many :tag_associations
	has_many :tags, through: :tag_associations do
		def visible
			where("tag_associations.visible = ?", true)
		end
	end

	def completions(id)
		return UserTrackCompletionAssociation.all.where(id: id)
	end
end
