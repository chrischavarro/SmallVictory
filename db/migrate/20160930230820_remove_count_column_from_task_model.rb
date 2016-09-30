class RemoveCountColumnFromTaskModel < ActiveRecord::Migration[5.0]
  def change
  	  remove_column :tasks, :count, :integer

  end
end
