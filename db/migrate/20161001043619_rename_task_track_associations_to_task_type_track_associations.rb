class RenameTaskTrackAssociationsToTaskTypeTrackAssociations < ActiveRecord::Migration[5.0]
  def change
  	rename_table :task_track_associations, :task_type_track_associations
  end
end
