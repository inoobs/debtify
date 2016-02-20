class CreatePayableItems < ActiveRecord::Migration[5.0]
  def change
    create_table :payable_items do |t|
      t.belongs_to :payable
      t.date :due_on
      t.datetime :paid_at
      t.decimal :amount

      t.timestamps
    end
  end
end
