class AddWeekNumberFieldToDisbursements < ActiveRecord::Migration[6.1]
  def change
    add_column :disbursements, :week_number, :integer
  end
end
