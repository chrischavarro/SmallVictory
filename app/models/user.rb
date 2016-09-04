class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
validates_plausible_phone :phone_number, presence: true
validates_plausible_phone :phone_number, with: /\A\+\d+/
validates_plausible_phone :phone_number, without: /\A\+\d+/
validates_plausible_phone :phone_number, presence: true, with: /\A\+\d+/

  phony_normalize :phone_number, default_country_code: 'US'
  phony_normalize :phone_number, as: :phone_number_normalized_version, default_country_code: 'US'
  phony_normalized_method :fax_number
end
