class AddDescriptionToPlugins < ActiveRecord::Migration[5.0]
  def change
    add_column :plugins, :description, :string
  end
end
