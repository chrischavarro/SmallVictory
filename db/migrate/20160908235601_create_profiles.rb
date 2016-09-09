class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
    	t.time :wake_up_time
    	t.boolean :monday
    	t.boolean :tuesday
    	t.boolean :wednedsay
    	t.boolean :thursday
    	t.boolean :friday
    	t.boolean :saturday
    	t.boolean :sunday
      t.timestamps
    end
  end
end
