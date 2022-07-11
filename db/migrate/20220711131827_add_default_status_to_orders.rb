class AddDefaultStatusToOrders < ActiveRecord::Migration[6.1]
  def change
    change_column :orders, :status, :string, default: "pending_pay"
  end
end
