class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	devise :omniauthable, :omniauth_providers => [:facebook, :twitter]
validates :phone_number, phony_plausible: true

  has_one :profile

  has_one :person_tag_association
  has_many :tags, through: :person_tag_association

  phony_normalize :phone_number, default_country_code: 'US'
  phony_normalize :phone_number, as: :phone_number_normalized_version, default_country_code: 'US'
  phony_normalized_method :fax_number

	def self.from_omniauth(auth)
	  	where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
	  		if auth.provider == 'facebook'
          user.email = auth.info.email
          user.password = Devise.friendly_token[0,20]
          user.first_name = auth.extra.raw_info.first_name
          user.last_name = auth.extra.raw_info.last_name
          user.profile_pic = auth.info.image + "?type=large"
          puts auth
        elsif auth.provider == 'twitter'
          user.email = auth.info.email
  	  		user.password = Devise.friendly_token[0,20]
          user.first_name = auth.info.name
          user.profile_pic = auth.info.image 
          puts auth

        end
  		end
	end

  def email_required?
    false
  end
# require "awesome_print"
# ap object, options = {}
end
