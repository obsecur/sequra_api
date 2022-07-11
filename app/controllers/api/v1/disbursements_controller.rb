# frozen_string_literal: true

module Api
  module V1
    class DisbursementsController < ApplicationController
      def index
        render json: disbursements
      end

      private

      def disbursements
        @disbursements ||= fetch_disbursements
      end

      def fetch_disbursements
        disbursements = Disbursement.all
        disbursements = disbursements.for_merchant(merchant_id) if merchant_id
        disbursements = disbursements.at_week(week) if week
        disbursements
      end

      def merchant_id
        params[:merchant_id]
      end

      def week
        params[:week]
      end
    end
  end
end