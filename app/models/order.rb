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
class Order < ApplicationRecord
  enum status: { pendig_pay: "pending_pay", completed: "completed" }

  # Associations
  belongs_to :merchant
  belongs_to :shopper

  # Validations
  validates :amount, presence: true

  # Scopes & Callbacks
end
