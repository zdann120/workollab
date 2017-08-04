class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.integer :assignee_id
      t.string :description, null: false
      t.boolean :complete, default: false

      t.timestamps
    end
    add_index :tasks, :assignee_id
  end
end
