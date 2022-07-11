# frozen_string_literal: true

module Api
  module V1
    class DisbursementSerializer < ApplicationSerializer
      attributes :id,
                 :amount_to_disburse,
                 :week_number,
                 :created_at,
                 :updated_at

      has_one :order, serializer: OrderSerializer

      def amount_to_disburse
        object.amount
      end
    end
  end
end
