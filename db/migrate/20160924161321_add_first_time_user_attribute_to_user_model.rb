class AddFirstTimeUserAttributeToUserModel < ActiveRecord::Migration[5.0]
  def change
  	add_column :users, :first_time_user, :boolean, default: true 
  end
end
