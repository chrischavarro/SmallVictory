class AddImageUrlToUserModel < ActiveRecord::Migration[5.0]
  def change
  	add_column :users, :profile_pic, :string, :null => true
  end
end
