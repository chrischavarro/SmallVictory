class CreatePersonTagAssociations < ActiveRecord::Migration[5.0]
  def change
    create_table :person_tag_associations do |t|
	    t.integer :user_id, index: true
	    t.integer :tag_id, index: true
      t.timestamps
    end
  end
end
