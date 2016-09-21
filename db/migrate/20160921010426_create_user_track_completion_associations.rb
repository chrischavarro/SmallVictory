class CreateUserTrackCompletionAssociations < ActiveRecord::Migration[5.0]
  def change
    create_table :user_track_completion_associations do |t|
    	t.integer :user_id
    	t.integer :track_id
      t.timestamps
    end
  end
end
