# frozen_string_literal: true

# == Schema Information
#
# Table name: orders
#
#  id           :bigint           not null, primary key
#  amount       :decimal(6, 2)
#  completed_at :datetime
#  status       :string           default("pendig_pay")
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  merchant_id  :bigint
#  shopper_id   :bigint
#
# Indexes
#
#  index_orders_on_merchant_id  (merchant_id)
#  index_orders_on_shopper_id   (shopper_id)
#
FactoryBot.define do
  factory :order do
    amount { "9.99" }
    completed_at { "2022-07-11 11:58:59" }
  end
end
