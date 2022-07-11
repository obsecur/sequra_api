# frozen_string_literal: true

# == Schema Information
#
# Table name: disbursements
#
#  id         :bigint           not null, primary key
#  amount     :decimal(6, 2)    not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  order_id   :bigint
#
# Indexes
#
#  index_disbursements_on_order_id  (order_id)
#
class Disbursement < ApplicationRecord
  # Associations
  belongs_to :order

  # Validations
  validates :amount, presence: true

  # Scopes & Callbacks
end
