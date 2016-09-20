class Tag < ApplicationRecord
	has_many :tag_associations
	has_many :tracks, through: :tag_associations
	has_many :person_tag_associations
	has_many :users, through: :person_tag_associations
end
