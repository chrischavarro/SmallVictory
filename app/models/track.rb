class Track < ApplicationRecord
	has_many :tags, through: :tag_associations
	has_many :tag_associations
end
