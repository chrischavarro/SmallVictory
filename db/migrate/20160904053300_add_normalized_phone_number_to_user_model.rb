class AddNormalizedPhoneNumberToUserModel < ActiveRecord::Migration[5.0]
  def change
  	add_column :users, :phone_number_normalized_version, :string
  end
end
