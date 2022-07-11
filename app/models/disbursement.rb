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
  MIN_FEE = 0.0095
  MIDDLE_FEE = 0.0085
  MAX_FEE = 0.01

  # Associations
  belongs_to :order

  # Validations
  validates :amount, presence: true
  validates :week_number, presence: true, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 53 }

  # Scopes & Callbacks
  scope :for_merchant, -> (merchant_id) { joins(:order).merge(Order.by_merchant(merchant_id)) }
  scope :at_week, -> (week) { where week_number: week }

  before_validation :set_week_number, on: :create
  before_validation :apply_fees, on: :create, if: :status_completed?

  def set_week_number
    self.week_number = Time.current.strftime('%U').to_i
  end

  def apply_fees
    if order.amount.between?(50, 300)
      self.amount = (order.amount - (order.amount * MIN_FEE)).to_s
    elsif order.amount > 300
      self.amount = (order.amount - (order.amount * MIDDLE_FEE)).to_s
    else
      self.amount = (order.amount - (order.amount * MAX_FEE)).to_s
    end
  end

  def status_completed?
    self.order.completed?
  end
end
