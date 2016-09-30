class CreateTaskTypeAssociations < ActiveRecord::Migration[5.0]
  def change
    create_table :task_type_associations do |t|

      t.timestamps
    end
  end
end
