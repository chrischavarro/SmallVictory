class AddCompletionCheckToUserTrackCompetionAssociation < ActiveRecord::Migration[5.0]
  def change
  	add_column :user_track_completion_associations, :completed, :boolean
  end
end
