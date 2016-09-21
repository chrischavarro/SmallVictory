class Track < ApplicationRecord
	has_many :tag_associations
	has_many :tags, through: :tag_associations do
		def visible
			where("tag_associations.visible = ?", true)
		end
	end
end
