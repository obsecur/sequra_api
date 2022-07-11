# frozen_string_literal: true

# == Schema Information
#
# Table name: disbursements
#
#  id          :bigint           not null, primary key
#  amount      :decimal(6, 2)    not null
#  week_number :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  order_id    :bigint
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
  validates :week_number, presence: true, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 53 }

  # Scopes & Callbacks
  scope :for_merchant, -> (merchant_id) { joins(:order).merge(Order.by_merchant(merchant_id)) }
  scope :at_week, -> (week) { where week_number: week }

  before_validation :set_week_number, on: :create

  def set_week_number
    self.week_number = Time.current.strftime('%U').to_i
  end
end
