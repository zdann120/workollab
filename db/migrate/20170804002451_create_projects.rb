class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.string :token, null: false
      t.integer :owner_id, null: false
      t.string :title, null: false
      t.string :description, default: nil
      t.datetime :start_date, default: nil
      t.datetime :end_date, default: nil

      t.timestamps
    end
    add_index :projects, :token, unique: true
    add_index :projects, :owner_id
  end
end
