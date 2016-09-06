class CreateTagAssociations < ActiveRecord::Migration[5.0]
  def change
    create_table :tag_associations do |t|

      t.timestamps
    end
  end
end
