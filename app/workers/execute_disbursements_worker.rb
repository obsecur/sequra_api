# frozen_string_literal: true

class ExecuteDisbursementsWorker
  include Sidekiq::Worker
  sidekiq_options queue: :default

  def perform
    # First target the completed orders
    completed_orders = Order.completed

    # create disbursements with fee calculated
    completed_orders.each do |order|
      order.disbursements.create
    end
  end
end
