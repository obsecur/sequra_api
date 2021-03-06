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
class Order < ApplicationRecord
  enum status: { pendig_pay: "pending_pay", completed: "completed" }

  # Associations
  belongs_to :merchant
  belongs_to :shopper
  has_many :disbursements

  # Validations
  validates :amount, presence: true
  after_create :set_status

  # Scopes & Callbacks
  scope :by_merchant, -> (merchant_id) { where merchant_id: merchant_id }
  scope :ready_for_disbursement, -> { where.not(completed_at: nil).where(status: :completed) }

  def set_status
    if completed_at.nil?
      self.pendig_pay!
    else
      self.completed!
    end
  end
end
