class ChangeUserTrackCompletionAssociationToCompletionAssociation < ActiveRecord::Migration[5.0]
  def change
  	rename_table :user_track_completion_associations, :user_completions
  end
end
