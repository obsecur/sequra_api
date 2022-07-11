class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.belongs_to :shopper
      t.belongs_to :merchant
      t.decimal :amount, precision: 6, scale: 2
      t.datetime :completed_at

      t.timestamps
    end
  end
end
