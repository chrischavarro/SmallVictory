class AddNameAndDescriptionToTrackModel < ActiveRecord::Migration[5.0]
  def change
  	add_column :tracks, :description, :string
  end
end
