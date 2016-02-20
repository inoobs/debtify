class CreatePluginsUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :plugins_users do |t|
      t.belongs_to :plugin
      t.belongs_to :user
      t.json :data

      t.timestamps
    end
  end
end
