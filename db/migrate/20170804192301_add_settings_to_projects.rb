class AddSettingsToProjects < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :settings, :jsonb
  end
end
