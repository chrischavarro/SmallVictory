class FixTag < ActiveRecord::Migration[5.0]
  def change
  	remove_column :tracks, :tag
  end
end
