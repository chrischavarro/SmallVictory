class CreateTaskTrackAssociations < ActiveRecord::Migration[5.0]
  def change
    create_table :task_track_associations do |t|
    	t.integer :task_id
    	t.integer :track_id
      t.timestamps
    end
  end
end
