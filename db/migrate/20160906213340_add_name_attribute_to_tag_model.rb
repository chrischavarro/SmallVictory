class AddNameAttributeToTagModel < ActiveRecord::Migration[5.0]
  def change
  	add_column :tags, :name, :string
  end
end
