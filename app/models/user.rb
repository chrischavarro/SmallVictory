class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	devise :omniauthable, :omniauth_providers => [:facebook, :twitter]
validates :phone_number, phony_plausible: true

  phony_normalize :phone_number, default_country_code: 'US'
  phony_normalize :phone_number, as: :phone_number_normalized_version, default_country_code: 'US'
  phony_normalized_method :fax_number

	def self.from_omniauth(auth)
	  	where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
	  		user.email = auth.info.email
	  		user.password = Devise.friendly_token[0,20]
        user.first_name = auth.extra.raw_info.first_name
	  		user.last_name = auth.extra.raw_info.last_name
        puts auth
  		end
	end

  def email_required?
    false
  end
end