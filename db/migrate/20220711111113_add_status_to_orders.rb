class AddStatusToOrders < ActiveRecord::Migration[6.1]
  def change
    rename_column :orders, :completed_at, :status
    change_column :orders, :status, :string
  end
end
