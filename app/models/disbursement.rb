# frozen_string_literal: true

# == Schema Information
#
# Table name: disbursements
#
#  id         :bigint           not null, primary key
#  amount     :decimal(, )
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

  # Scopes & Callbacks
end
