# frozen_string_literal: true

module Api
  module V1
    class OrderSerializer < ApplicationSerializer
      attributes :id,
                 :amount,
                 :status,
                 :completed_at,
                 :created_at,
                 :updated_at
    end
  end
end
