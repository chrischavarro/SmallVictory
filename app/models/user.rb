class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	devise :omniauthable, :omniauth_providers => [:facebook, :twitter]
  validates :phone_number, phony_plausible: true

  after_destroy :destroy_user_associations
  
  has_one :profile

  has_many :person_tag_associations
  has_many :tags, through: :person_tag_associations

  has_many :user_track_associations
  has_many :tracks, through: :user_track_associations

  has_many :user_track_completion_associations

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

  private
# Done to destroy any associations after user deletes their account
  def destroy_user_associations
    person_tag_associations.each do |person_tag_association|
      person_tag_association.destroy 
    end
    user_track_associations.each do |user_track_association|
      user_track_association.destroy 
    end
    if profile
      profile.destroy
    end
    user_track_completion_associations.each do |user_track_completion_association|
      user_track_completion_association.destroy
    end
  end
end
