# frozen_string_literal: true

# == Schema Information
#
# Table name: orders
#
#  id          :bigint           not null, primary key
#  amount      :decimal(6, 2)
#  status      :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  merchant_id :bigint
#  shopper_id  :bigint
#
# Indexes
#
#  index_orders_on_merchant_id  (merchant_id)
#  index_orders_on_shopper_id   (shopper_id)
#
require "rails_helper"

xdescribe Order, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
