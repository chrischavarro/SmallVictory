class Profile < ApplicationRecord
	belongs_to :user
  validates :phone_number, phony_plausible: true
  phony_normalize :phone_number, default_country_code: 'US'
  phony_normalize :phone_number, as: :phone_number_normalized_version, default_country_code: 'US'
  phony_normalized_method :fax_number

end
