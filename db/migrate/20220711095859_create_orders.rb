class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.belongs_to :shopper
      t.belongs_to :merchant
      t.decimal :amount
      t.datetime :completed_at

      t.timestamps
    end
  end
end
