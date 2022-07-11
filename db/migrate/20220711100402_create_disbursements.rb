class CreateDisbursements < ActiveRecord::Migration[6.1]
  def change
    create_table :disbursements do |t|
      t.belongs_to :order
      t.decimal :amount

      t.timestamps
    end
  end
end
