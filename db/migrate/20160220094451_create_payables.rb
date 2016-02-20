class CreatePayables < ActiveRecord::Migration[5.0]
  def change
    create_table :payables do |t|
      t.string :name
      t.text :description
      t.belongs_to :user
      t.string :recurring_type, index: true
      t.date :recurring_ends_on

      t.timestamps
    end
  end
end
