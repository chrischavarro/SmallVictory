class FixWednesdayTypoInProfileModel < ActiveRecord::Migration[5.0]
  def change
  	rename_column :profiles, :wednedsay, :wednesday
  end
end
