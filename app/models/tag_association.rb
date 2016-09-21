class TagAssociation < ApplicationRecord
	belongs_to :track
	belongs_to :tag

	has_many :person_tag_associations
	has_many :users, through: :person_tag_associations
end
