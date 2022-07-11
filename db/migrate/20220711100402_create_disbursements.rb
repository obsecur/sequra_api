class CreateDisbursements < ActiveRecord::Migration[6.1]
  def change
    create_table :disbursements do |t|
      t.belongs_to :order
      t.decimal :amount, null: false, precision: 6, scale: 2

      t.timestamps
    end
  end
end
