class AddNormalizePhoneToProfileModel < ActiveRecord::Migration[5.0]
  def change
  	add_column :profiles, :phone_number_normalized_version, :string
  end
end
