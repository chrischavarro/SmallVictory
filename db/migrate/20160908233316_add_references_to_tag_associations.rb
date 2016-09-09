class AddReferencesToTagAssociations < ActiveRecord::Migration[5.0]
  def change
  	add_column :tag_associations, :tag_id, :integer, index: true
  	add_column :tag_associations, :track_id, :integer, index: true
  end
end
