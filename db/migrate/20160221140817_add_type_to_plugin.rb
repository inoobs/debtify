class AddTypeToPlugin < ActiveRecord::Migration[5.0]
  def up
    add_column :plugins, :plugin_type, :string, index: true
  end

  def down
    remove_column :plugins, :plugin_type
  end
end
